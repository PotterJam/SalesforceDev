trigger ReferralProxyTrigger on Referral_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralProxyHandler.handleAfterDelete(Trigger.old);
    }
}
