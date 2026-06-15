import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getPools from '@salesforce/apex/LeadRoundRobinController.getPools';
import getPoolMembers from '@salesforce/apex/LeadRoundRobinController.getPoolMembers';
import addMember from '@salesforce/apex/LeadRoundRobinController.addMember';
import removeMember from '@salesforce/apex/LeadRoundRobinController.removeMember';
import toggleAvailability from '@salesforce/apex/LeadRoundRobinController.toggleAvailability';
import updateCapacity from '@salesforce/apex/LeadRoundRobinController.updateCapacity';
import getRecentLogs from '@salesforce/apex/LeadRoundRobinController.getRecentLogs';

const MEMBER_COLUMNS = [
    { label: 'User', fieldName: 'userName', type: 'text' },
    { label: 'Sort Order', fieldName: 'Sort_Order__c', type: 'number' },
    {
        label: 'Available',
        fieldName: 'Is_Available__c',
        type: 'boolean',
        cellAttributes: { alignment: 'center' }
    },
    { label: 'Max Open Leads', fieldName: 'Max_Open_Leads__c', type: 'number' },
    {
        type: 'action',
        typeAttributes: {
            rowActions: [
                { label: 'Toggle Availability', name: 'toggle_availability' },
                { label: 'Update Capacity', name: 'update_capacity' },
                { label: 'Remove', name: 'remove' }
            ]
        }
    }
];

const LOG_COLUMNS = [
    { label: 'Log #', fieldName: 'Name', type: 'text' },
    { label: 'Lead', fieldName: 'leadName', type: 'text' },
    { label: 'Assigned To', fieldName: 'assignedToName', type: 'text' },
    { label: 'Status', fieldName: 'Status__c', type: 'text' },
    { label: 'Date', fieldName: 'Assigned_Date__c', type: 'date',
        typeAttributes: { year: 'numeric', month: 'short', day: '2-digit',
            hour: '2-digit', minute: '2-digit' }
    },
    { label: 'Message', fieldName: 'Error_Message__c', type: 'text' }
];

export default class LeadRoundRobinAdmin extends LightningElement {
    @track pools = [];
    @track members = [];
    @track logs = [];
    selectedPoolId;
    showAddMemberModal = false;
    newMemberUserId;
    newMemberSortOrder;

    memberColumns = MEMBER_COLUMNS;
    logColumns = LOG_COLUMNS;

    connectedCallback() {
        this.loadPools();
    }

    get poolOptions() {
        return this.pools.map(pool => ({
            label: pool.Pool_Name__c + (pool.Is_Active__c ? '' : ' (Inactive)'),
            value: pool.Id
        }));
    }

    get isSaveDisabled() {
        return !this.newMemberUserId || !this.newMemberSortOrder;
    }

    async loadPools() {
        try {
            this.pools = await getPools();
        } catch (error) {
            this.showError('Error loading pools', error);
        }
    }

    async loadMembers() {
        try {
            const data = await getPoolMembers({ poolId: this.selectedPoolId });
            this.members = data.map(member => ({
                ...member,
                userName: member.User__r ? member.User__r.Name : ''
            }));
        } catch (error) {
            this.showError('Error loading members', error);
        }
    }

    async loadLogs() {
        try {
            const data = await getRecentLogs({ poolId: this.selectedPoolId, limitCount: 20 });
            this.logs = data.map(log => ({
                ...log,
                leadName: log.Lead__r ? log.Lead__r.Name : '',
                assignedToName: log.Assigned_To__r ? log.Assigned_To__r.Name : ''
            }));
        } catch (error) {
            this.showError('Error loading logs', error);
        }
    }

    handlePoolChange(event) {
        this.selectedPoolId = event.detail.value;
        this.loadMembers();
        this.loadLogs();
    }

    handleOpenAddMember() {
        this.newMemberUserId = null;
        this.newMemberSortOrder = this.members.length + 1;
        this.showAddMemberModal = true;
    }

    handleCloseAddMember() {
        this.showAddMemberModal = false;
    }

    handleUserSelection(event) {
        this.newMemberUserId = event.detail.recordId;
    }

    handleSortOrderChange(event) {
        this.newMemberSortOrder = event.detail.value;
    }

    async handleSaveMember() {
        try {
            await addMember({
                poolId: this.selectedPoolId,
                userId: this.newMemberUserId,
                sortOrder: this.newMemberSortOrder
            });
            this.showAddMemberModal = false;
            this.showSuccess('Member added successfully');
            this.loadMembers();
        } catch (error) {
            this.showError('Error adding member', error);
        }
    }

    async handleMemberRowAction(event) {
        const action = event.detail.action;
        const row = event.detail.row;

        switch (action.name) {
            case 'toggle_availability':
                await this.handleToggleAvailability(row);
                break;
            case 'update_capacity':
                await this.handleUpdateCapacity(row);
                break;
            case 'remove':
                await this.handleRemoveMember(row);
                break;
            default:
                break;
        }
    }

    async handleToggleAvailability(row) {
        try {
            await toggleAvailability({
                memberId: row.Id,
                isAvailable: !row.Is_Available__c
            });
            this.showSuccess('Availability updated');
            this.loadMembers();
        } catch (error) {
            this.showError('Error updating availability', error);
        }
    }

    async handleUpdateCapacity(row) {
        const newCapacity = window.prompt(
            'Enter new max open leads capacity:',
            row.Max_Open_Leads__c
        );
        if (newCapacity === null) return;

        const parsed = parseInt(newCapacity, 10);
        if (isNaN(parsed) || parsed < 0) {
            this.showError('Invalid capacity', { body: { message: 'Please enter a valid number.' } });
            return;
        }

        try {
            await updateCapacity({ memberId: row.Id, maxLeads: parsed });
            this.showSuccess('Capacity updated');
            this.loadMembers();
        } catch (error) {
            this.showError('Error updating capacity', error);
        }
    }

    async handleRemoveMember(row) {
        try {
            await removeMember({ memberId: row.Id });
            this.showSuccess('Member removed');
            this.loadMembers();
        } catch (error) {
            this.showError('Error removing member', error);
        }
    }

    showSuccess(message) {
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success',
            message: message,
            variant: 'success'
        }));
    }

    showError(title, error) {
        const message = error?.body?.message || error?.message || 'Unknown error';
        this.dispatchEvent(new ShowToastEvent({
            title: title,
            message: message,
            variant: 'error'
        }));
    }
}
