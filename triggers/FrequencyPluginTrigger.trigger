trigger FrequencyPluginTrigger on Frequency_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyPluginHandler.handleAfterDelete(Trigger.old);
    }
}
