trigger DiscountActionTrigger on Discount_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountActionHandler.handleAfterDelete(Trigger.old);
    }
}
