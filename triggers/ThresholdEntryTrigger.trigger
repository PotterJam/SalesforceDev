trigger ThresholdEntryTrigger on Threshold_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdEntryHandler.handleAfterDelete(Trigger.old);
    }
}
