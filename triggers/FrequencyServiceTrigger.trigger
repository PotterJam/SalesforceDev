trigger FrequencyServiceTrigger on Frequency_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyServiceHandler.handleAfterDelete(Trigger.old);
    }
}
