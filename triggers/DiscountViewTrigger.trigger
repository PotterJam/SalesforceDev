trigger DiscountViewTrigger on Discount_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountViewHandler.handleAfterDelete(Trigger.old);
    }
}
