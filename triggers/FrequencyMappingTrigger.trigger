trigger FrequencyMappingTrigger on Frequency_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyMappingHandler.handleAfterDelete(Trigger.old);
    }
}
