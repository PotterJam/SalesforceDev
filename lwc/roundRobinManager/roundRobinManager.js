import { LightningElement, track } from 'lwc';
import getGroups from '@salesforce/apex/LeadRoundRobinController.getGroups';
import getMembers from '@salesforce/apex/LeadRoundRobinController.getMembers';
import toggleGroupActive from '@salesforce/apex/LeadRoundRobinController.toggleGroupActive';
import toggleMemberActive from '@salesforce/apex/LeadRoundRobinController.toggleMemberActive';
import resetCounters from '@salesforce/apex/LeadRoundRobinController.resetCounters';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const MEMBER_COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Queue Name', fieldName: 'Queue_Name__c', type: 'text' },
    { label: 'Queue Id', fieldName: 'Queue_Id__c', type: 'text' },
    { label: 'Sort Order', fieldName: 'Sort_Order__c', type: 'number' },
    { label: 'Active', fieldName: 'Active__c', type: 'boolean' },
    { label: 'Assignments', fieldName: 'Assignment_Count__c', type: 'number' },
    { label: 'Current Load', fieldName: 'Current_Load__c', type: 'number' },
    { label: 'Max Capacity', fieldName: 'Max_Capacity__c', type: 'number' },
    { label: 'Last Assigned', fieldName: 'Last_Assigned_Date__c', type: 'date',
        typeAttributes: { year: 'numeric', month: 'short', day: '2-digit',
            hour: '2-digit', minute: '2-digit' }
    },
    {
        type: 'action',
        typeAttributes: {
            rowActions: [
                { label: 'Toggle Active', name: 'toggle_active' }
            ]
        }
    }
];

export default class RoundRobinManager extends LightningElement {
    @track groups = [];
    @track isLoading = true;
    memberColumns = MEMBER_COLUMNS;

    connectedCallback() {
        this.loadGroups();
    }

    get hasGroups() {
        return this.groups && this.groups.length > 0;
    }

    async loadGroups() {
        this.isLoading = true;
        try {
            const data = await getGroups();
            this.groups = data.map(g => ({
                ...g,
                isExpanded: false,
                members: [],
                hasMembers: false,
                toggleLabel: g.Active__c ? 'Deactivate' : 'Activate',
                expandLabel: 'Show Members',
                expandIcon: 'utility:chevronright'
            }));
        } catch (error) {
            this.showToast('Error', this.reduceErrors(error), 'error');
        } finally {
            this.isLoading = false;
        }
    }

    async handleExpandGroup(event) {
        const groupId = event.currentTarget.dataset.groupId;
        const idx = this.groups.findIndex(g => g.Id === groupId);
        if (idx === -1) return;

        const group = { ...this.groups[idx] };

        if (group.isExpanded) {
            group.isExpanded = false;
            group.expandLabel = 'Show Members';
            group.expandIcon = 'utility:chevronright';
        } else {
            try {
                const members = await getMembers({ groupId });
                group.members = members;
                group.hasMembers = members && members.length > 0;
            } catch (error) {
                this.showToast('Error', this.reduceErrors(error), 'error');
            }
            group.isExpanded = true;
            group.expandLabel = 'Hide Members';
            group.expandIcon = 'utility:chevrondown';
        }

        this.groups = [
            ...this.groups.slice(0, idx),
            group,
            ...this.groups.slice(idx + 1)
        ];
    }

    async handleToggleGroup(event) {
        const groupId = event.currentTarget.dataset.groupId;
        const currentActive = event.currentTarget.dataset.active === 'true';
        try {
            await toggleGroupActive({ groupId, isActive: !currentActive });
            this.showToast('Success', 'Group status updated.', 'success');
            await this.loadGroups();
        } catch (error) {
            this.showToast('Error', this.reduceErrors(error), 'error');
        }
    }

    async handleResetCounters(event) {
        const groupId = event.currentTarget.dataset.groupId;
        try {
            await resetCounters({ groupId });
            this.showToast('Success', 'Counters reset successfully.', 'success');
            await this.loadGroups();
        } catch (error) {
            this.showToast('Error', this.reduceErrors(error), 'error');
        }
    }

    async handleMemberAction(event) {
        const action = event.detail.action;
        const row = event.detail.row;

        if (action.name === 'toggle_active') {
            try {
                await toggleMemberActive({
                    memberId: row.Id,
                    isActive: !row.Active__c
                });
                this.showToast('Success', 'Member status updated.', 'success');
                await this.loadGroups();
            } catch (error) {
                this.showToast('Error', this.reduceErrors(error), 'error');
            }
        }
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }

    reduceErrors(error) {
        if (typeof error === 'string') return error;
        if (error?.body?.message) return error.body.message;
        if (error?.message) return error.message;
        return 'Unknown error';
    }
}
