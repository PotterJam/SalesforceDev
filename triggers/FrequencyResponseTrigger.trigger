trigger FrequencyResponseTrigger on Frequency_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyResponseHandler.handleAfterDelete(Trigger.old);
    }
}
