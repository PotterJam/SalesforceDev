trigger TrainingEndpointTrigger on Training_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
