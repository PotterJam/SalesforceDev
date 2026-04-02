trigger TrendAuditTrigger on Trend_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendAuditHandler.handleAfterDelete(Trigger.old);
    }
}
