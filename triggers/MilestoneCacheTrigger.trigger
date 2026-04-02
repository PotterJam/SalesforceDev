trigger MilestoneCacheTrigger on Milestone_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneCacheHandler.handleAfterDelete(Trigger.old);
    }
}
