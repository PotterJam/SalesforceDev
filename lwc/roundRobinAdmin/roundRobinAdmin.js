import { LightningElement, wire, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import getConfig from '@salesforce/apex/RoundRobinController.getConfig';
import getMembers from '@salesforce/apex/RoundRobinController.getMembers';
import saveMember from '@salesforce/apex/RoundRobinController.saveMember';
import deleteMember from '@salesforce/apex/RoundRobinController.deleteMember';
import toggleAvailability from '@salesforce/apex/RoundRobinController.toggleAvailability';
import updateSortOrder from '@salesforce/apex/RoundRobinController.updateSortOrder';
import searchUsers from '@salesforce/apex/RoundRobinController.searchUsers';

const MEMBER_COLUMNS = [
    { label: 'Member', fieldName: 'userName', type: 'text' },
    { label: 'Available', fieldName: 'Is_Available__c', type: 'boolean' },
    { label: 'Sort Order', fieldName: 'Sort_Order__c', type: 'number' },
    { label: 'Last Assigned', fieldName: 'Last_Assigned_Date__c', type: 'date',
        typeAttributes: { year: 'numeric', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit' }
    },
    { label: 'Count', fieldName: 'Assignment_Count__c', type: 'number' },
    {
        type: 'action',
        typeAttributes: {
            rowActions: [
                { label: 'Toggle Availability', name: 'toggle' },
                { label: 'Move Up', name: 'move_up' },
                { label: 'Move Down', name: 'move_down' },
                { label: 'Remove', name: 'delete' }
            ]
        }
    }
];

const USER_COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Email', fieldName: 'Email', type: 'email' }
];

export default class RoundRobinAdmin extends LightningElement {
    @track config;
    @track members = [];
    @track userSearchResults = [];
    @track selectedUserId;
    @track selectedUserRows = [];
    @track searchTerm = '';
    @track isLoading = false;

    memberColumns = MEMBER_COLUMNS;
    userColumns = USER_COLUMNS;

    wiredConfigResult;
    wiredMembersResult;
    searchTimeout;

    @wire(getConfig)
    wiredConfig(result) {
        this.wiredConfigResult = result;
        if (result.data) {
            this.config = result.data;
        } else if (result.error) {
            this.showError('Error loading configuration', result.error.body?.message);
        }
    }

    @wire(getMembers, { configId: '$config.Id' })
    wiredMembers(result) {
        this.wiredMembersResult = result;
        if (result.data) {
            this.members = result.data.map(member => ({
                ...member,
                userName: member.User__r ? member.User__r.Name : 'Unknown User'
            }));
        } else if (result.error) {
            this.showError('Error loading members', result.error.body?.message);
        }
    }

    get isAddDisabled() {
        return !this.selectedUserId;
    }

    handleSearchChange(event) {
        const value = event.target.value;
        this.searchTerm = value;
        clearTimeout(this.searchTimeout);

        if (value.length < 2) {
            this.userSearchResults = [];
            return;
        }

        this.searchTimeout = setTimeout(() => {
            this.performSearch(value);
        }, 300);
    }

    async performSearch(term) {
        try {
            this.userSearchResults = await searchUsers({ searchTerm: term });
        } catch (error) {
            this.showError('Search failed', error.body?.message);
        }
    }

    handleUserSelection(event) {
        const selectedRows = event.detail.selectedRows;
        if (selectedRows.length > 0) {
            this.selectedUserId = selectedRows[0].Id;
            this.selectedUserRows = [selectedRows[0].Id];
        } else {
            this.selectedUserId = null;
            this.selectedUserRows = [];
        }
    }

    async handleAddMember() {
        if (!this.selectedUserId || !this.config) return;

        this.isLoading = true;
        try {
            const newMember = {
                Round_Robin_Config__c: this.config.Id,
                User__c: this.selectedUserId,
                Is_Available__c: true,
                Sort_Order__c: this.members.length + 1,
                Assignment_Count__c: 0
            };
            await saveMember({ member: newMember });
            this.showSuccess('Member added successfully');
            this.selectedUserId = null;
            this.selectedUserRows = [];
            this.userSearchResults = [];
            this.searchTerm = '';
            await refreshApex(this.wiredMembersResult);
        } catch (error) {
            this.showError('Failed to add member', error.body?.message);
        } finally {
            this.isLoading = false;
        }
    }

    async handleRowAction(event) {
        const action = event.detail.action;
        const row = event.detail.row;

        switch (action.name) {
            case 'toggle':
                await this.handleToggle(row);
                break;
            case 'move_up':
                await this.handleMoveUp(row);
                break;
            case 'move_down':
                await this.handleMoveDown(row);
                break;
            case 'delete':
                await this.handleDelete(row);
                break;
            default:
                break;
        }
    }

    async handleToggle(row) {
        this.isLoading = true;
        try {
            await toggleAvailability({
                memberId: row.Id,
                isAvailable: !row.Is_Available__c
            });
            this.showSuccess('Availability updated');
            await refreshApex(this.wiredMembersResult);
        } catch (error) {
            this.showError('Failed to toggle availability', error.body?.message);
        } finally {
            this.isLoading = false;
        }
    }

    async handleMoveUp(row) {
        const index = this.members.findIndex(m => m.Id === row.Id);
        if (index <= 0) return;
        await this.reorder(index, index - 1);
    }

    async handleMoveDown(row) {
        const index = this.members.findIndex(m => m.Id === row.Id);
        if (index >= this.members.length - 1) return;
        await this.reorder(index, index + 1);
    }

    async reorder(fromIndex, toIndex) {
        this.isLoading = true;
        try {
            const reordered = [...this.members];
            const [moved] = reordered.splice(fromIndex, 1);
            reordered.splice(toIndex, 0, moved);

            const memberIds = reordered.map(m => m.Id);
            await updateSortOrder({ memberIds });
            this.showSuccess('Order updated');
            await refreshApex(this.wiredMembersResult);
        } catch (error) {
            this.showError('Failed to update order', error.body?.message);
        } finally {
            this.isLoading = false;
        }
    }

    async handleDelete(row) {
        this.isLoading = true;
        try {
            await deleteMember({ memberId: row.Id });
            this.showSuccess('Member removed');
            await refreshApex(this.wiredMembersResult);
        } catch (error) {
            this.showError('Failed to remove member', error.body?.message);
        } finally {
            this.isLoading = false;
        }
    }

    showSuccess(message) {
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success',
            message,
            variant: 'success'
        }));
    }

    showError(title, message) {
        this.dispatchEvent(new ShowToastEvent({
            title,
            message: message || 'An unexpected error occurred',
            variant: 'error'
        }));
    }
}
