trigger ReportLogTrigger on Report_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportLogHandler.handleAfterDelete(Trigger.old);
    }
}
