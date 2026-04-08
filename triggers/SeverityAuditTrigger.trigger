trigger SeverityAuditTrigger on Severity_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityAuditHandler.handleAfterDelete(Trigger.old);
    }
}
