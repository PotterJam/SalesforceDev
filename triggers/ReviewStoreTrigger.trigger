trigger ReviewStoreTrigger on Review_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewStoreHandler.handleAfterDelete(Trigger.old);
    }
}
