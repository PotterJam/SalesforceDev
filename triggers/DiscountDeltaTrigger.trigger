trigger DiscountDeltaTrigger on Discount_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
