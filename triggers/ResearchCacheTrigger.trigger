trigger ResearchCacheTrigger on Research_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchCacheHandler.handleAfterDelete(Trigger.old);
    }
}
