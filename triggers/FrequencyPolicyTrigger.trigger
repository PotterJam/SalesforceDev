trigger FrequencyPolicyTrigger on Frequency_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
