trigger ReferralConfigTrigger on Referral_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralConfigHandler.handleAfterDelete(Trigger.old);
    }
}
