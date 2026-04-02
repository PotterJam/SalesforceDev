trigger ContractManagerTrigger on Contract_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractManagerHandler.handleAfterDelete(Trigger.old);
    }
}
