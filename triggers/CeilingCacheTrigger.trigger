trigger CeilingCacheTrigger on Ceiling_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingCacheHandler.handleAfterDelete(Trigger.old);
    }
}
