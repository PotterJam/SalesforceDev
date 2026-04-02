trigger FrequencyHubTrigger on Frequency_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyHubHandler.handleAfterDelete(Trigger.old);
    }
}
