trigger ReportSummaryTrigger on Report_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
