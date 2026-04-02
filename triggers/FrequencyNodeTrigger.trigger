trigger FrequencyNodeTrigger on Frequency_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyNodeHandler.handleAfterDelete(Trigger.old);
    }
}
