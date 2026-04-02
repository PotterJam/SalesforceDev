trigger ThresholdAdapterTrigger on Threshold_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
