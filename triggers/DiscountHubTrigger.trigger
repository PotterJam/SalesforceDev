trigger DiscountHubTrigger on Discount_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountHubHandler.handleAfterDelete(Trigger.old);
    }
}
