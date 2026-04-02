trigger MarketingAuditTrigger on Marketing_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingAuditHandler.handleAfterDelete(Trigger.old);
    }
}
