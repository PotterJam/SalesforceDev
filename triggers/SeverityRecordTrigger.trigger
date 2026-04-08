trigger SeverityRecordTrigger on Severity_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityRecordHandler.handleAfterDelete(Trigger.old);
    }
}
