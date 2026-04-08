trigger ReferralHandlerTrigger on Referral_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
