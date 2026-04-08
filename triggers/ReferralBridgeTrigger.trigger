trigger ReferralBridgeTrigger on Referral_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
