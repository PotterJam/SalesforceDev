trigger FrequencyStreamTrigger on Frequency_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyStreamHandler.handleAfterDelete(Trigger.old);
    }
}
