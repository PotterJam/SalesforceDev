trigger ThresholdSummaryTrigger on Threshold_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
