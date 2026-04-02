trigger FrequencyDeltaTrigger on Frequency_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
