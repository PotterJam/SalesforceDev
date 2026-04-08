trigger DiscountBindingTrigger on Discount_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountBindingHandler.handleAfterDelete(Trigger.old);
    }
}
