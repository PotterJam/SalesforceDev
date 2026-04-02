trigger SeverityEntryTrigger on Severity_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityEntryHandler.handleAfterDelete(Trigger.old);
    }
}
