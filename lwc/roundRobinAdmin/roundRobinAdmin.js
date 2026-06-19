import { LightningElement, wire, track } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getQueues from '@salesforce/apex/RoundRobinController.getQueues';
import getQueueMembers from '@salesforce/apex/RoundRobinController.getQueueMembers';
import toggleMemberAvailability from '@salesforce/apex/RoundRobinController.toggleMemberAvailability';
import updateMemberOrder from '@salesforce/apex/RoundRobinController.updateMemberOrder';
import addMember from '@salesforce/apex/RoundRobinController.addMember';
import removeMember from '@salesforce/apex/RoundRobinController.removeMember';

const COLUMNS = [
    { label: 'Sort Order', fieldName: 'Sort_Order__c', type: 'number', initialWidth: 110 },
    { label: 'User', fieldName: 'userName', type: 'text' },
    {
        label: 'Available',
        fieldName: 'Is_Available__c',
        type: 'boolean',
        initialWidth: 100,
        cellAttributes: { iconName: { fieldName: 'availabilityIcon' } }
    },
    { label: 'Assignments', fieldName: 'Assignment_Count__c', type: 'number', initialWidth: 120 },
    {
        type: 'action',
        typeAttributes: {
            rowActions: [
                { label: 'Move Up', name: 'move_up' },
                { label: 'Move Down', name: 'move_down' },
                { label: 'Toggle Availability', name: 'toggle_available' },
                { label: 'Remove', name: 'remove' }
            ]
        }
    }
];

export default class RoundRobinAdmin extends LightningElement {
    @track selectedQueueId;
    @track members = [];
    @track isAddModalOpen = false;
    @track selectedUserId;

    columns = COLUMNS;
    queues = [];
    wiredMembersResult;

    userFilter = {
        criteria: [
            { fieldPath: 'IsActive', operator: 'eq', value: true }
        ]
    };

    @wire(getQueues)
    wiredQueues({ data, error }) {
        if (data) {
            this.queues = data;
        } else if (error) {
            this.showToast('Error', 'Failed to load queues: ' + this.reduceError(error), 'error');
        }
    }

    @wire(getQueueMembers, { queueId: '$selectedQueueId' })
    wiredMembers(result) {
        this.wiredMembersResult = result;
        if (result.data) {
            this.members = result.data.map(member => ({
                ...member,
                userName: member.User__r ? member.User__r.Name : 'Unknown User',
                availabilityIcon: member.Is_Available__c ? 'utility:success' : 'utility:block_visitor'
            }));
        } else if (result.error) {
            this.showToast('Error', 'Failed to load members: ' + this.reduceError(result.error), 'error');
        }
    }

    get queueOptions() {
        return this.queues.map(queue => ({
            label: queue.Name + (queue.Active__c ? ' (Active)' : ''),
            value: queue.Id
        }));
    }

    get hasMembers() {
        return this.members && this.members.length > 0;
    }

    get isAddDisabled() {
        return !this.selectedUserId;
    }

    handleQueueChange(event) {
        this.selectedQueueId = event.detail.value;
    }

    handleRowAction(event) {
        const action = event.detail.action;
        const row = event.detail.row;

        switch (action.name) {
            case 'move_up':
                this.moveMember(row.Id, -1);
                break;
            case 'move_down':
                this.moveMember(row.Id, 1);
                break;
            case 'toggle_available':
                this.toggleAvailability(row.Id, !row.Is_Available__c);
                break;
            case 'remove':
                this.handleRemoveMember(row.Id);
                break;
            default:
                break;
        }
    }

    async moveMember(memberId, direction) {
        const currentIndex = this.members.findIndex(m => m.Id === memberId);
        const newIndex = currentIndex + direction;

        if (newIndex < 0 || newIndex >= this.members.length) {
            return;
        }

        const reordered = [...this.members];
        const temp = reordered[currentIndex];
        reordered[currentIndex] = reordered[newIndex];
        reordered[newIndex] = temp;

        const memberIds = reordered.map(m => m.Id);

        try {
            await updateMemberOrder({ memberIds });
            await refreshApex(this.wiredMembersResult);
            this.showToast('Success', 'Member order updated', 'success');
        } catch (error) {
            this.showToast('Error', 'Failed to update order: ' + this.reduceError(error), 'error');
        }
    }

    async toggleAvailability(memberId, isAvailable) {
        try {
            await toggleMemberAvailability({ memberId, isAvailable });
            await refreshApex(this.wiredMembersResult);
            this.showToast('Success', 'Availability updated', 'success');
        } catch (error) {
            this.showToast('Error', 'Failed to update availability: ' + this.reduceError(error), 'error');
        }
    }

    async handleRemoveMember(memberId) {
        try {
            await removeMember({ memberId });
            await refreshApex(this.wiredMembersResult);
            this.showToast('Success', 'Member removed', 'success');
        } catch (error) {
            this.showToast('Error', 'Failed to remove member: ' + this.reduceError(error), 'error');
        }
    }

    handleOpenAddModal() {
        this.isAddModalOpen = true;
        this.selectedUserId = null;
    }

    handleCloseAddModal() {
        this.isAddModalOpen = false;
        this.selectedUserId = null;
    }

    handleUserSelection(event) {
        this.selectedUserId = event.detail.recordId;
    }

    async handleAddMember() {
        try {
            await addMember({ queueId: this.selectedQueueId, userId: this.selectedUserId });
            await refreshApex(this.wiredMembersResult);
            this.handleCloseAddModal();
            this.showToast('Success', 'Member added to queue', 'success');
        } catch (error) {
            this.showToast('Error', 'Failed to add member: ' + this.reduceError(error), 'error');
        }
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }

    reduceError(error) {
        if (typeof error === 'string') {
            return error;
        }
        if (error.body && error.body.message) {
            return error.body.message;
        }
        if (error.message) {
            return error.message;
        }
        return 'Unknown error';
    }
}
