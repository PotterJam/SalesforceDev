trigger FrequencySummaryTrigger on Frequency_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencySummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencySummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencySummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencySummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencySummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencySummaryHandler.handleAfterDelete(Trigger.old);
    }
}
