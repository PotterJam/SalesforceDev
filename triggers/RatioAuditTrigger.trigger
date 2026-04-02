trigger RatioAuditTrigger on Ratio_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioAuditHandler.handleAfterDelete(Trigger.old);
    }
}
