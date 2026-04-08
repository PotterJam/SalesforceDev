trigger ReferralPlanTrigger on Referral_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralPlanHandler.handleAfterDelete(Trigger.old);
    }
}
