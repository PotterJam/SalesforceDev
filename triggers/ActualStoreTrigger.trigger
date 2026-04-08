trigger ActualStoreTrigger on Actual_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualStoreHandler.handleAfterDelete(Trigger.old);
    }
}
