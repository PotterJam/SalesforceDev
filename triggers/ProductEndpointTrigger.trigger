trigger ProductEndpointTrigger on Product_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
