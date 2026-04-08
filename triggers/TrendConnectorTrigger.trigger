trigger TrendConnectorTrigger on Trend_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
