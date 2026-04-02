trigger DiscountControllerTrigger on Discount_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountControllerHandler.handleAfterDelete(Trigger.old);
    }
}
