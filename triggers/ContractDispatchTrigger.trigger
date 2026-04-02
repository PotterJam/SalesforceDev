trigger ContractDispatchTrigger on Contract_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
