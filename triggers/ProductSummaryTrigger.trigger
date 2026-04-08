trigger ProductSummaryTrigger on Product_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
