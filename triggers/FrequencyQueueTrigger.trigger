trigger FrequencyQueueTrigger on Frequency_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyQueueHandler.handleAfterDelete(Trigger.old);
    }
}
