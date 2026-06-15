import { LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import getGroups from '@salesforce/apex/RoundRobinAdminController.getGroups';
import saveGroup from '@salesforce/apex/RoundRobinAdminController.saveGroup';
import deleteGroup from '@salesforce/apex/RoundRobinAdminController.deleteGroup';
import getMembers from '@salesforce/apex/RoundRobinAdminController.getMembers';
import saveMembers from '@salesforce/apex/RoundRobinAdminController.saveMembers';
import deleteMember from '@salesforce/apex/RoundRobinAdminController.deleteMember';
import getLogs from '@salesforce/apex/RoundRobinAdminController.getLogs';
import searchUsers from '@salesforce/apex/RoundRobinAdminController.searchUsers';

export default class RoundRobinAdmin extends LightningElement {
    @track groups;
    @track selectedGroup;
    @track members = [];
    @track logs = [];
    @track userSearchResults;
    @track showUserSearch = false;

    wiredGroupsResult;
    selectedGroupId;
    searchTimeout;

    @wire(getGroups)
    wiredGroups(result) {
        this.wiredGroupsResult = result;
        if (result.data) {
            this.groups = result.data;
        }
    }

    get groupItemClass() {
        return 'slds-p-around_small slds-border_bottom slds-is-relative group-item';
    }

    handleSelectGroup(event) {
        const groupId = event.currentTarget.dataset.id;
        this.selectedGroupId = groupId;
        const group = this.groups.find(g => g.Id === groupId);
        this.selectedGroup = { ...group };
        this.loadMembers();
        this.loadLogs();
    }

    handleNewGroup() {
        this.selectedGroup = {
            Active__c: true,
            Priority__c: 1,
            Description__c: '',
            Lead_Source_Criteria__c: '',
            Country_Criteria__c: '',
            Rating_Criteria__c: ''
        };
        this.members = [];
        this.logs = [];
        this.selectedGroupId = null;
    }

    handleGroupFieldChange(event) {
        const field = event.currentTarget.dataset.field;
        const value = field === 'Active__c' ? event.target.checked : event.target.value;
        this.selectedGroup = { ...this.selectedGroup, [field]: value };
    }

    async handleSaveGroup() {
        try {
            const result = await saveGroup({ grp: this.selectedGroup });
            this.selectedGroup = { ...result };
            this.selectedGroupId = result.Id;
            await refreshApex(this.wiredGroupsResult);
            this.showToast('Success', 'Group saved successfully', 'success');
        } catch (error) {
            this.showToast('Error', error.body?.message || 'Failed to save group', 'error');
        }
    }

    async handleDeleteGroup() {
        if (!this.selectedGroupId) {
            return;
        }
        try {
            await deleteGroup({ groupId: this.selectedGroupId });
            this.selectedGroup = null;
            this.selectedGroupId = null;
            this.members = [];
            this.logs = [];
            await refreshApex(this.wiredGroupsResult);
            this.showToast('Success', 'Group deleted', 'success');
        } catch (error) {
            this.showToast('Error', error.body?.message || 'Failed to delete group', 'error');
        }
    }

    async loadMembers() {
        if (!this.selectedGroupId) {
            this.members = [];
            return;
        }
        try {
            const result = await getMembers({ groupId: this.selectedGroupId });
            this.members = result.map(m => ({ ...m }));
        } catch (error) {
            this.showToast('Error', 'Failed to load members', 'error');
        }
    }

    async loadLogs() {
        if (!this.selectedGroupId) {
            this.logs = [];
            return;
        }
        try {
            const result = await getLogs({ groupId: this.selectedGroupId, limitCount: 50 });
            this.logs = result.map(log => ({
                ...log,
                formattedDate: log.Assignment_Date__c
                    ? new Date(log.Assignment_Date__c).toLocaleString()
                    : '',
                statusClass: log.Status__c === 'Success'
                    ? 'slds-badge_success'
                    : log.Status__c === 'Error'
                        ? 'slds-badge_error'
                        : ''
            }));
        } catch (error) {
            this.showToast('Error', 'Failed to load logs', 'error');
        }
    }

    handleAddMember() {
        this.showUserSearch = true;
        this.userSearchResults = null;
    }

    handleUserSearch(event) {
        const searchTerm = event.target.value;
        clearTimeout(this.searchTimeout);
        if (searchTerm.length < 2) {
            this.userSearchResults = null;
            return;
        }
        this.searchTimeout = setTimeout(async () => {
            try {
                this.userSearchResults = await searchUsers({ searchTerm });
            } catch (error) {
                this.userSearchResults = null;
            }
        }, 300);
    }

    async handleSelectUser(event) {
        const userId = event.currentTarget.dataset.id;
        const user = this.userSearchResults.find(u => u.Id === userId);
        const newMember = {
            Group__c: this.selectedGroupId,
            User__c: userId,
            User__r: { Name: user.Name },
            Sort_Order__c: this.members.length + 1,
            Is_Active__c: true
        };
        try {
            const result = await saveMembers({ members: [newMember] });
            this.showUserSearch = false;
            this.userSearchResults = null;
            await this.loadMembers();
            this.showToast('Success', `${user.Name} added to group`, 'success');
        } catch (error) {
            this.showToast('Error', error.body?.message || 'Failed to add member', 'error');
        }
    }

    handleMemberFieldChange(event) {
        const memberId = event.currentTarget.dataset.id;
        const field = event.currentTarget.dataset.field;
        const value = field === 'Is_Active__c' ? event.target.checked : event.target.value;
        this.members = this.members.map(m =>
            m.Id === memberId ? { ...m, [field]: value } : m
        );
    }

    async handleSaveMembers() {
        try {
            const membersToSave = this.members.map(m => ({
                Id: m.Id,
                Group__c: m.Group__c,
                User__c: m.User__c,
                Sort_Order__c: m.Sort_Order__c,
                Is_Active__c: m.Is_Active__c
            }));
            await saveMembers({ members: membersToSave });
            await this.loadMembers();
            this.showToast('Success', 'Members saved', 'success');
        } catch (error) {
            this.showToast('Error', error.body?.message || 'Failed to save members', 'error');
        }
    }

    async handleDeleteMember(event) {
        const memberId = event.currentTarget.dataset.id;
        try {
            await deleteMember({ memberId });
            await this.loadMembers();
            this.showToast('Success', 'Member removed', 'success');
        } catch (error) {
            this.showToast('Error', error.body?.message || 'Failed to remove member', 'error');
        }
    }

    handleRefreshLogs() {
        this.loadLogs();
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}
