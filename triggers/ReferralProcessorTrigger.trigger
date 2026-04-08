trigger ReferralProcessorTrigger on Referral_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
