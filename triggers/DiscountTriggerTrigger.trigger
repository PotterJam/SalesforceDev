trigger DiscountTriggerTrigger on Discount_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
