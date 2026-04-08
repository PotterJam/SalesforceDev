trigger ThresholdProcessTrigger on Threshold_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdProcessHandler.handleAfterDelete(Trigger.old);
    }
}
