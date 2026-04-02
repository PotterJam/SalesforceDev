trigger ReferralAdapterTrigger on Referral_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
