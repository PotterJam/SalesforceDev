trigger DiscountJobTrigger on Discount_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountJobHandler.handleAfterDelete(Trigger.old);
    }
}
