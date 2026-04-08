trigger ContractStoreTrigger on Contract_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractStoreHandler.handleAfterDelete(Trigger.old);
    }
}
