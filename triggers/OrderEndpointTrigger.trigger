trigger OrderEndpointTrigger on Order_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
