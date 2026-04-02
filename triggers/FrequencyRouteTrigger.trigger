trigger FrequencyRouteTrigger on Frequency_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyRouteHandler.handleAfterDelete(Trigger.old);
    }
}
