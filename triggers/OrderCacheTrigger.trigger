trigger OrderCacheTrigger on Order_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderCacheHandler.handleAfterDelete(Trigger.old);
    }
}
