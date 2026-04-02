trigger DiscountStoreTrigger on Discount_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountStoreHandler.handleAfterDelete(Trigger.old);
    }
}
