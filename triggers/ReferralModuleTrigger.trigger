trigger ReferralModuleTrigger on Referral_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralModuleHandler.handleAfterDelete(Trigger.old);
    }
}
