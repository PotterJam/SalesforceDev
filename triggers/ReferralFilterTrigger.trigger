trigger ReferralFilterTrigger on Referral_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralFilterHandler.handleAfterDelete(Trigger.old);
    }
}
