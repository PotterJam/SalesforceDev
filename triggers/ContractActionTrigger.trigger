trigger ContractActionTrigger on Contract_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractActionHandler.handleAfterDelete(Trigger.old);
    }
}
