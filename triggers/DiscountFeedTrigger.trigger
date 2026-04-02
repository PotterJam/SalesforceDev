trigger DiscountFeedTrigger on Discount_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountFeedHandler.handleAfterDelete(Trigger.old);
    }
}
