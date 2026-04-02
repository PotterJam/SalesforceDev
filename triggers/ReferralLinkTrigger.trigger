trigger ReferralLinkTrigger on Referral_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralLinkHandler.handleAfterDelete(Trigger.old);
    }
}
