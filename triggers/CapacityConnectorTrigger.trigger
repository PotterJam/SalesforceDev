trigger CapacityConnectorTrigger on Capacity_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
