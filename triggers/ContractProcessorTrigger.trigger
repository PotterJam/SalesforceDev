trigger ContractProcessorTrigger on Contract_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
