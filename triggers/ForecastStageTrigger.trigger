trigger ForecastStageTrigger on Forecast_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastStageHandler.handleAfterDelete(Trigger.old);
    }
}
