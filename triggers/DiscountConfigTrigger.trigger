trigger DiscountConfigTrigger on Discount_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountConfigHandler.handleAfterDelete(Trigger.old);
    }
}
