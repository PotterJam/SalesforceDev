trigger TargetEndpointTrigger on Target_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
