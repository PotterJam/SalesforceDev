trigger ReferralStreamTrigger on Referral_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralStreamHandler.handleAfterDelete(Trigger.old);
    }
}
