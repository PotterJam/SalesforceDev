trigger ReferralAuditTrigger on Referral_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralAuditHandler.handleAfterDelete(Trigger.old);
    }
}
