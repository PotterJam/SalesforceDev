trigger ReferralControllerTrigger on Referral_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralControllerHandler.handleAfterDelete(Trigger.old);
    }
}
