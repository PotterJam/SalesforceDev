trigger ReferralTransformTrigger on Referral_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralTransformHandler.handleAfterDelete(Trigger.old);
    }
}
