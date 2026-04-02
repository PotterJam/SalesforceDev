trigger DiscountNodeTrigger on Discount_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountNodeHandler.handleAfterDelete(Trigger.old);
    }
}
