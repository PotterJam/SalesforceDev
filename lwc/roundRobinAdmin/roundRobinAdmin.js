import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import getAgents from '@salesforce/apex/RoundRobinController.getAgents';
import addAgent from '@salesforce/apex/RoundRobinController.addAgent';
import removeAgent from '@salesforce/apex/RoundRobinController.removeAgent';
import updateAvailability from '@salesforce/apex/RoundRobinController.updateAvailability';
import reorderAgents from '@salesforce/apex/RoundRobinController.reorderAgents';

export default class RoundRobinAdmin extends LightningElement {
    agents = [];
    isLoading = true;
    showAddModal = false;
    selectedUserId = null;
    wiredAgentsResult;

    get hasAgents() {
        return this.agents && this.agents.length > 0;
    }

    get isAddDisabled() {
        return !this.selectedUserId;
    }

    @wire(getAgents)
    wiredAgents(result) {
        this.wiredAgentsResult = result;
        this.isLoading = false;
        if (result.data) {
            this.agents = result.data.map((agent, index, arr) => ({
                ...agent,
                isFirst: index === 0,
                isLast: index === arr.length - 1
            }));
        } else if (result.error) {
            this.showToast('Error', result.error.body.message, 'error');
        }
    }

    handleOpenAddModal() {
        this.showAddModal = true;
        this.selectedUserId = null;
    }

    handleCloseAddModal() {
        this.showAddModal = false;
        this.selectedUserId = null;
    }

    handleUserSelected(event) {
        this.selectedUserId = event.detail.recordId;
    }

    async handleAddAgent() {
        try {
            const nextSortOrder = this.agents.length + 1;
            await addAgent({ userId: this.selectedUserId, sortOrder: nextSortOrder });
            this.showToast('Success', 'Agent added to round-robin pool.', 'success');
            this.handleCloseAddModal();
            await refreshApex(this.wiredAgentsResult);
        } catch (error) {
            this.showToast('Error', error.body.message, 'error');
        }
    }

    async handleRemove(event) {
        const agentId = event.currentTarget.dataset.id;
        try {
            await removeAgent({ agentId });
            this.showToast('Success', 'Agent removed from round-robin pool.', 'success');
            await refreshApex(this.wiredAgentsResult);
        } catch (error) {
            this.showToast('Error', error.body.message, 'error');
        }
    }

    async handleAvailabilityChange(event) {
        const agentId = event.currentTarget.dataset.id;
        const isAvailable = event.target.checked;
        try {
            await updateAvailability({ agentId, isAvailable });
            this.showToast('Success', 'Availability updated.', 'success');
            await refreshApex(this.wiredAgentsResult);
        } catch (error) {
            this.showToast('Error', error.body.message, 'error');
        }
    }

    async handleMoveUp(event) {
        const agentId = event.currentTarget.dataset.id;
        const index = this.agents.findIndex(a => a.Id === agentId);
        if (index <= 0) return;
        await this.swapAgents(index, index - 1);
    }

    async handleMoveDown(event) {
        const agentId = event.currentTarget.dataset.id;
        const index = this.agents.findIndex(a => a.Id === agentId);
        if (index < 0 || index >= this.agents.length - 1) return;
        await this.swapAgents(index, index + 1);
    }

    async swapAgents(indexA, indexB) {
        const reordered = [...this.agents];
        [reordered[indexA], reordered[indexB]] = [reordered[indexB], reordered[indexA]];
        const agentIds = reordered.map(a => a.Id);

        try {
            await reorderAgents({ agentIdsJson: JSON.stringify(agentIds) });
            this.showToast('Success', 'Agent order updated.', 'success');
            await refreshApex(this.wiredAgentsResult);
        } catch (error) {
            this.showToast('Error', error.body.message, 'error');
        }
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}
