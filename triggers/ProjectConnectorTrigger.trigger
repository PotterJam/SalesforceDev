trigger ProjectConnectorTrigger on Project_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
