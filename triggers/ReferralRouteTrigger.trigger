trigger ReferralRouteTrigger on Referral_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralRouteHandler.handleAfterDelete(Trigger.old);
    }
}
