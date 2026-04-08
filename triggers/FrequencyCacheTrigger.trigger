trigger FrequencyCacheTrigger on Frequency_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyCacheHandler.handleAfterDelete(Trigger.old);
    }
}
