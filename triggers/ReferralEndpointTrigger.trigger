trigger ReferralEndpointTrigger on Referral_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
