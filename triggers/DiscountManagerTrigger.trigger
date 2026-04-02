trigger DiscountManagerTrigger on Discount_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountManagerHandler.handleAfterDelete(Trigger.old);
    }
}
