trigger TagEndpointTrigger on Tag_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
