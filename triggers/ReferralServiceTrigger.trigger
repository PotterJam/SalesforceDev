trigger ReferralServiceTrigger on Referral_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralServiceHandler.handleAfterDelete(Trigger.old);
    }
}
