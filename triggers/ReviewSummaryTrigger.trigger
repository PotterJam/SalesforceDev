trigger ReviewSummaryTrigger on Review_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
