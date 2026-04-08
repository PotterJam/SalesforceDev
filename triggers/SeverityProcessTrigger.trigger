trigger SeverityProcessTrigger on Severity_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityProcessHandler.handleAfterDelete(Trigger.old);
    }
}
