trigger FrequencyLogTrigger on Frequency_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyLogHandler.handleAfterDelete(Trigger.old);
    }
}
