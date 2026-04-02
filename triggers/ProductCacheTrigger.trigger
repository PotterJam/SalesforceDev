trigger ProductCacheTrigger on Product_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductCacheHandler.handleAfterDelete(Trigger.old);
    }
}
