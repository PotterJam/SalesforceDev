trigger DiscountSummaryTrigger on Discount_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
