trigger DiscountFilterTrigger on Discount_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountFilterHandler.handleAfterDelete(Trigger.old);
    }
}
