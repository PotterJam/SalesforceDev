trigger ReferralViewTrigger on Referral_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralViewHandler.handleAfterDelete(Trigger.old);
    }
}
