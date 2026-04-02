trigger ReferralItemTrigger on Referral_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralItemHandler.handleAfterDelete(Trigger.old);
    }
}
