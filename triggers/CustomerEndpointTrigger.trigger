trigger CustomerEndpointTrigger on Customer_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
