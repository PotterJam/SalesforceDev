trigger DiscountLinkTrigger on Discount_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountLinkHandler.handleAfterDelete(Trigger.old);
    }
}
