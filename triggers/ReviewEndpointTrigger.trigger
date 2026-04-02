trigger ReviewEndpointTrigger on Review_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
