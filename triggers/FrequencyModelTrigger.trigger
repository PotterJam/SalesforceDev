trigger FrequencyModelTrigger on Frequency_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyModelHandler.handleAfterDelete(Trigger.old);
    }
}
