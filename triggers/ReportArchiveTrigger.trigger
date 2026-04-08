trigger ReportArchiveTrigger on Report_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
