trigger BaselineStoreTrigger on Baseline_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineStoreHandler.handleAfterDelete(Trigger.old);
    }
}
