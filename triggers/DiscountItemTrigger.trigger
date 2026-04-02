trigger DiscountItemTrigger on Discount_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountItemHandler.handleAfterDelete(Trigger.old);
    }
}
