trigger DiscountDetailTrigger on Discount_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountDetailHandler.handleAfterDelete(Trigger.old);
    }
}
