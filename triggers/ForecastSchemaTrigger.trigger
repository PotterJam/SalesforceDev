trigger ForecastSchemaTrigger on Forecast_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
