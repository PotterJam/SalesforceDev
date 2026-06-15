import { LightningElement, track, wire } from 'lwc';
import getConfig from '@salesforce/apex/LeadRoundRobinController.getConfig';
import saveConfig from '@salesforce/apex/LeadRoundRobinController.saveConfig';
import saveQueues from '@salesforce/apex/LeadRoundRobinController.saveQueues';
import saveCriteria from '@salesforce/apex/LeadRoundRobinController.saveCriteria';
import deleteQueues from '@salesforce/apex/LeadRoundRobinController.deleteQueues';
import deleteCriteria from '@salesforce/apex/LeadRoundRobinController.deleteCriteria';
import getAssignmentLogs from '@salesforce/apex/LeadRoundRobinController.getAssignmentLogs';
import getAvailableQueues from '@salesforce/apex/LeadRoundRobinController.getAvailableQueues';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

const QUEUE_COLUMNS = [
    { label: 'Queue Name', fieldName: 'queueName', type: 'text' },
    { label: 'Sort Order', fieldName: 'sortOrder', type: 'number', editable: true },
    { label: 'Active', fieldName: 'active', type: 'boolean' },
    {
        type: 'action',
        typeAttributes: {
            rowActions: [{ label: 'Remove', name: 'remove' }]
        }
    }
];

const CRITERIA_COLUMNS = [
    { label: 'Field API Name', fieldName: 'fieldApiName', type: 'text' },
    { label: 'Operator', fieldName: 'operator', type: 'text' },
    { label: 'Value', fieldName: 'value', type: 'text' },
    { label: 'Active', fieldName: 'active', type: 'boolean' },
    {
        type: 'action',
        typeAttributes: {
            rowActions: [{ label: 'Remove', name: 'remove' }]
        }
    }
];

const LOG_COLUMNS = [
    { label: 'Log #', fieldName: 'name', type: 'text' },
    { label: 'Lead', fieldName: 'leadName', type: 'text' },
    { label: 'Queue', fieldName: 'queueName', type: 'text' },
    { label: 'Status', fieldName: 'status', type: 'text' },
    { label: 'Date', fieldName: 'assignedDate', type: 'date',
        typeAttributes: { year: 'numeric', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit' }
    },
    { label: 'Error', fieldName: 'errorMessage', type: 'text' }
];

const OPERATOR_OPTIONS = [
    { label: 'Equals', value: 'Equals' },
    { label: 'Not Equals', value: 'Not Equals' },
    { label: 'Contains', value: 'Contains' },
    { label: 'Not Contains', value: 'Not Contains' },
    { label: 'Is Blank', value: 'Is Blank' },
    { label: 'Is Not Blank', value: 'Is Not Blank' }
];

export default class LeadRoundRobinAdmin extends LightningElement {
    @track configId;
    @track isActive = false;
    @track description = '';
    @track queues = [];
    @track criteria = [];
    @track logs = [];
    @track error;
    @track queueDraftValues = [];

    selectedQueueId = '';
    newCriteriaField = '';
    newCriteriaOperator = 'Equals';
    newCriteriaValue = '';
    availableQueues = [];

    queueColumns = QUEUE_COLUMNS;
    criteriaColumns = CRITERIA_COLUMNS;
    logColumns = LOG_COLUMNS;
    operatorOptions = OPERATOR_OPTIONS;

    wiredConfigResult;
    wiredLogsResult;

    @wire(getConfig)
    wiredConfig(result) {
        this.wiredConfigResult = result;
        const { data, error } = result;
        if (data) {
            this.configId = data.Id;
            this.isActive = data.Active__c;
            this.description = data.Description__c || '';
            this.queues = (data.Round_Robin_Queues__r || []).map(q => ({
                id: q.Id,
                queueName: q.Queue_Name__c,
                queueId: q.Queue_Id__c,
                sortOrder: q.Sort_Order__c,
                active: q.Active__c
            }));
            this.criteria = (data.Round_Robin_Criteria__r || []).map(c => ({
                id: c.Id,
                fieldApiName: c.Field_API_Name__c,
                operator: c.Operator__c,
                value: c.Value__c,
                active: c.Active__c
            }));
            this.error = undefined;
        } else if (error) {
            this.error = error.body ? error.body.message : 'Error loading configuration';
        }
    }

    @wire(getAssignmentLogs, { recordLimit: 50 })
    wiredLogs(result) {
        this.wiredLogsResult = result;
        const { data, error } = result;
        if (data) {
            this.logs = data.map(l => ({
                id: l.Id,
                name: l.Name,
                leadName: l.Lead__r ? l.Lead__r.Name : '',
                queueName: l.Queue_Name__c,
                status: l.Status__c,
                assignedDate: l.Assigned_Date__c,
                errorMessage: l.Error_Message__c || ''
            }));
        } else if (error) {
            this.error = error.body ? error.body.message : 'Error loading logs';
        }
    }

    @wire(getAvailableQueues)
    wiredAvailableQueues({ data, error }) {
        if (data) {
            this.availableQueues = data;
        } else if (error) {
            this.error = error.body ? error.body.message : 'Error loading available queues';
        }
    }

    get availableQueueOptions() {
        return this.availableQueues.map(q => ({
            label: q.queueName,
            value: q.queueId
        }));
    }

    get hasQueues() {
        return this.queues && this.queues.length > 0;
    }

    get hasCriteria() {
        return this.criteria && this.criteria.length > 0;
    }

    get hasLogs() {
        return this.logs && this.logs.length > 0;
    }

    get isAddQueueDisabled() {
        return !this.selectedQueueId;
    }

    get isAddCriteriaDisabled() {
        return !this.newCriteriaField || !this.newCriteriaOperator;
    }

    handleActiveToggle(event) {
        this.isActive = event.target.checked;
    }

    handleDescriptionChange(event) {
        this.description = event.target.value;
    }

    handleQueueSelection(event) {
        this.selectedQueueId = event.detail.value;
    }

    handleCriteriaFieldChange(event) {
        this.newCriteriaField = event.target.value;
    }

    handleCriteriaOperatorChange(event) {
        this.newCriteriaOperator = event.detail.value;
    }

    handleCriteriaValueChange(event) {
        this.newCriteriaValue = event.target.value;
    }

    async handleSaveConfig() {
        try {
            const config = {
                Id: this.configId || undefined,
                Active__c: this.isActive,
                Description__c: this.description
            };
            const result = await saveConfig({ config });
            this.configId = result.Id;
            this.showToast('Success', 'Configuration saved', 'success');
            await refreshApex(this.wiredConfigResult);
        } catch (error) {
            this.showToast('Error', error.body ? error.body.message : 'Error saving configuration', 'error');
        }
    }

    async handleAddQueue() {
        if (!this.configId) {
            this.showToast('Error', 'Please save the configuration first', 'error');
            return;
        }
        const selectedQueue = this.availableQueues.find(q => q.queueId === this.selectedQueueId);
        if (!selectedQueue) return;

        const maxOrder = this.queues.reduce((max, q) => Math.max(max, q.sortOrder || 0), -1);
        const newQueue = {
            Name: selectedQueue.queueName,
            Config__c: this.configId,
            Queue_Id__c: selectedQueue.queueId,
            Queue_Name__c: selectedQueue.queueName,
            Sort_Order__c: maxOrder + 1,
            Active__c: true
        };

        try {
            await saveQueues({ queues: [newQueue] });
            this.selectedQueueId = '';
            this.showToast('Success', 'Queue added to rotation', 'success');
            await refreshApex(this.wiredConfigResult);
        } catch (error) {
            this.showToast('Error', error.body ? error.body.message : 'Error adding queue', 'error');
        }
    }

    async handleQueueRowAction(event) {
        const action = event.detail.action;
        const row = event.detail.row;
        if (action.name === 'remove') {
            try {
                await deleteQueues({ queueIds: [row.id] });
                this.showToast('Success', 'Queue removed from rotation', 'success');
                await refreshApex(this.wiredConfigResult);
            } catch (error) {
                this.showToast('Error', error.body ? error.body.message : 'Error removing queue', 'error');
            }
        }
    }

    async handleQueueSave(event) {
        const updatedFields = event.detail.draftValues;
        const queuesToUpdate = updatedFields.map(draft => ({
            Id: draft.id,
            Sort_Order__c: draft.sortOrder
        }));

        try {
            await saveQueues({ queues: queuesToUpdate });
            this.queueDraftValues = [];
            this.showToast('Success', 'Queue order updated', 'success');
            await refreshApex(this.wiredConfigResult);
        } catch (error) {
            this.showToast('Error', error.body ? error.body.message : 'Error updating queues', 'error');
        }
    }

    async handleAddCriteria() {
        if (!this.configId) {
            this.showToast('Error', 'Please save the configuration first', 'error');
            return;
        }

        const newCriterion = {
            Name: this.newCriteriaField + ' ' + this.newCriteriaOperator,
            Config__c: this.configId,
            Field_API_Name__c: this.newCriteriaField,
            Operator__c: this.newCriteriaOperator,
            Value__c: this.newCriteriaValue,
            Active__c: true
        };

        try {
            await saveCriteria({ criteria: [newCriterion] });
            this.newCriteriaField = '';
            this.newCriteriaOperator = 'Equals';
            this.newCriteriaValue = '';
            this.showToast('Success', 'Criterion added', 'success');
            await refreshApex(this.wiredConfigResult);
        } catch (error) {
            this.showToast('Error', error.body ? error.body.message : 'Error adding criterion', 'error');
        }
    }

    async handleCriteriaRowAction(event) {
        const action = event.detail.action;
        const row = event.detail.row;
        if (action.name === 'remove') {
            try {
                await deleteCriteria({ criteriaIds: [row.id] });
                this.showToast('Success', 'Criterion removed', 'success');
                await refreshApex(this.wiredConfigResult);
            } catch (error) {
                this.showToast('Error', error.body ? error.body.message : 'Error removing criterion', 'error');
            }
        }
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}
