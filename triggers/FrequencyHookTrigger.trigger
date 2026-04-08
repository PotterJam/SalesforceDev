trigger FrequencyHookTrigger on Frequency_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyHookHandler.handleAfterDelete(Trigger.old);
    }
}
