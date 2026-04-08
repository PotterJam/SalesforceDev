trigger GradeCacheTrigger on Grade_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeCacheHandler.handleAfterDelete(Trigger.old);
    }
}
