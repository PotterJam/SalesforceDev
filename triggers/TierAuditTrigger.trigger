trigger TierAuditTrigger on Tier_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierAuditHandler.handleAfterDelete(Trigger.old);
    }
}
