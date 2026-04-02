trigger CategoryEndpointTrigger on Category_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
