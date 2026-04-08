trigger RatioConnectorTrigger on Ratio_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
