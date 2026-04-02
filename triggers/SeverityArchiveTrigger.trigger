trigger SeverityArchiveTrigger on Severity_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
