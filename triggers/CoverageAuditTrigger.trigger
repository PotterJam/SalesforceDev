trigger CoverageAuditTrigger on Coverage_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageAuditHandler.handleAfterDelete(Trigger.old);
    }
}
