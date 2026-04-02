trigger ReportStreamTrigger on Report_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportStreamHandler.handleAfterDelete(Trigger.old);
    }
}
