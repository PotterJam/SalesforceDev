trigger UtilizationConnectorTrigger on Utilization_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
