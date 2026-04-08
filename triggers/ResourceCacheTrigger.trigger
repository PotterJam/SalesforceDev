trigger ResourceCacheTrigger on Resource_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceCacheHandler.handleAfterDelete(Trigger.old);
    }
}
