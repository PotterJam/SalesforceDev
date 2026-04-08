trigger ThresholdPolicyTrigger on Threshold_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
