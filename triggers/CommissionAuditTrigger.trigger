trigger CommissionAuditTrigger on Commission_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionAuditHandler.handleAfterDelete(Trigger.old);
    }
}
