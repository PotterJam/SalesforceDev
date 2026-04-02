trigger StatusEndpointTrigger on Status_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
