trigger ProcurementConnectorTrigger on Procurement_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
