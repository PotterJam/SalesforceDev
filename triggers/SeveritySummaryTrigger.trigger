trigger SeveritySummaryTrigger on Severity_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeveritySummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeveritySummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeveritySummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeveritySummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeveritySummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeveritySummaryHandler.handleAfterDelete(Trigger.old);
    }
}
