trigger FrequencyProcessorTrigger on Frequency_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
