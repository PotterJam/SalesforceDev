trigger ReferralProcessTrigger on Referral_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralProcessHandler.handleAfterDelete(Trigger.old);
    }
}
