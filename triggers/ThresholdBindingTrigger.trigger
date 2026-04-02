trigger ThresholdBindingTrigger on Threshold_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdBindingHandler.handleAfterDelete(Trigger.old);
    }
}
