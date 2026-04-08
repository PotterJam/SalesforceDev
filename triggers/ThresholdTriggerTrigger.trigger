trigger ThresholdTriggerTrigger on Threshold_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
