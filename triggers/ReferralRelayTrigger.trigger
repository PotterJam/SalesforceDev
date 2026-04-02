trigger ReferralRelayTrigger on Referral_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralRelayHandler.handleAfterDelete(Trigger.old);
    }
}
