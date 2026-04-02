trigger DiscountTaskTrigger on Discount_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountTaskHandler.handleAfterDelete(Trigger.old);
    }
}
