trigger ReviewConnectorTrigger on Review_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
