trigger ContractHandlerTrigger on Contract_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
