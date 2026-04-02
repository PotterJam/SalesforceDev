trigger DiscountQueueTrigger on Discount_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountQueueHandler.handleAfterDelete(Trigger.old);
    }
}
