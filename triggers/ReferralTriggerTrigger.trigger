trigger ReferralTriggerTrigger on Referral_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
