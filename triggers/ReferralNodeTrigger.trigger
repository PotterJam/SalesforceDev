trigger ReferralNodeTrigger on Referral_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralNodeHandler.handleAfterDelete(Trigger.old);
    }
}
