trigger ThresholdAuditTrigger on Threshold_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdAuditHandler.handleAfterDelete(Trigger.old);
    }
}
