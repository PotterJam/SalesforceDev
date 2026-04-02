trigger CapacityEndpointTrigger on Capacity_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
