trigger ReferralActionTrigger on Referral_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralActionHandler.handleAfterDelete(Trigger.old);
    }
}
