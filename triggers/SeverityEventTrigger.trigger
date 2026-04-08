trigger SeverityEventTrigger on Severity_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityEventHandler.handleAfterDelete(Trigger.old);
    }
}
