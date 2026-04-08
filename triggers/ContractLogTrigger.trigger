trigger ContractLogTrigger on Contract_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractLogHandler.handleAfterDelete(Trigger.old);
    }
}
