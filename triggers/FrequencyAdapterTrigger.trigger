trigger FrequencyAdapterTrigger on Frequency_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
