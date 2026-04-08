trigger DiscountDispatchTrigger on Discount_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
