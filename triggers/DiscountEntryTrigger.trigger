trigger DiscountEntryTrigger on Discount_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountEntryHandler.handleAfterDelete(Trigger.old);
    }
}
