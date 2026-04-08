trigger ReferralDetailTrigger on Referral_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralDetailHandler.handleAfterDelete(Trigger.old);
    }
}
