trigger ContractBatchTrigger on Contract_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractBatchHandler.handleAfterDelete(Trigger.old);
    }
}
