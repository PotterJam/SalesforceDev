trigger LeadCacheTrigger on Lead_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadCacheHandler.handleAfterDelete(Trigger.old);
    }
}
