trigger ForecastPolicyTrigger on Forecast_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
