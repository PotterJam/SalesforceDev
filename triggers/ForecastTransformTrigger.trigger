trigger ForecastTransformTrigger on Forecast_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastTransformHandler.handleAfterDelete(Trigger.old);
    }
}
