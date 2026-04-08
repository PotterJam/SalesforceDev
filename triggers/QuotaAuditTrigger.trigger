trigger QuotaAuditTrigger on Quota_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaAuditHandler.handleAfterDelete(Trigger.old);
    }
}
