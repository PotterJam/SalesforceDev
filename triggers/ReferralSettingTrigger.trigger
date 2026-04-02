trigger ReferralSettingTrigger on Referral_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralSettingHandler.handleAfterDelete(Trigger.old);
    }
}
