trigger ResolutionCacheTrigger on Resolution_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionCacheHandler.handleAfterDelete(Trigger.old);
    }
}
