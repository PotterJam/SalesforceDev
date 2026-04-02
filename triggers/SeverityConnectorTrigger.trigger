trigger SeverityConnectorTrigger on Severity_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
