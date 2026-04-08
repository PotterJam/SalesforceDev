trigger DiscountCacheTrigger on Discount_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountCacheHandler.handleAfterDelete(Trigger.old);
    }
}
