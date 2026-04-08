trigger FrequencyDispatchTrigger on Frequency_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
