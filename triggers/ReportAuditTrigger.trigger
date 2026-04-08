trigger ReportAuditTrigger on Report_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportAuditHandler.handleAfterDelete(Trigger.old);
    }
}
