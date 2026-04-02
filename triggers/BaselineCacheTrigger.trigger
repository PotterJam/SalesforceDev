trigger BaselineCacheTrigger on Baseline_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineCacheHandler.handleAfterDelete(Trigger.old);
    }
}
