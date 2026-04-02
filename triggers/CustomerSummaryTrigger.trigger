trigger CustomerSummaryTrigger on Customer_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
