trigger PriorityEndpointTrigger on Priority_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
