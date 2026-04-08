trigger ThresholdHubTrigger on Threshold_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdHubHandler.handleAfterDelete(Trigger.old);
    }
}
