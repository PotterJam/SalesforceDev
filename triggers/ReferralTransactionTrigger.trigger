trigger ReferralTransactionTrigger on Referral_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
