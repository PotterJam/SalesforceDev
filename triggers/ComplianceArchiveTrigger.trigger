trigger ComplianceArchiveTrigger on Compliance_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ComplianceArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ComplianceArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ComplianceArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ComplianceArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
