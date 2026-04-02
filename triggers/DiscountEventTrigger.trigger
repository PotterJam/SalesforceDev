trigger DiscountEventTrigger on Discount_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountEventHandler.handleAfterDelete(Trigger.old);
    }
}
