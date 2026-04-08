trigger ForecastMappingTrigger on Forecast_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastMappingHandler.handleAfterDelete(Trigger.old);
    }
}
