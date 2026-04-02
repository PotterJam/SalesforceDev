trigger DiscountAdapterTrigger on Discount_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
