trigger ProcurementEndpointTrigger on Procurement_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
