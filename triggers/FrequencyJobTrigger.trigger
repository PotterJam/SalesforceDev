trigger FrequencyJobTrigger on Frequency_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyJobHandler.handleAfterDelete(Trigger.old);
    }
}
