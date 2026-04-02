trigger DiscountResponseTrigger on Discount_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountResponseHandler.handleAfterDelete(Trigger.old);
    }
}
