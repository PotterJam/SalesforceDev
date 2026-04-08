trigger TrainingCacheTrigger on Training_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingCacheHandler.handleAfterDelete(Trigger.old);
    }
}
