trigger ReferralPluginTrigger on Referral_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralPluginHandler.handleAfterDelete(Trigger.old);
    }
}
