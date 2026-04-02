trigger DiscountServiceTrigger on Discount_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountServiceHandler.handleAfterDelete(Trigger.old);
    }
}
