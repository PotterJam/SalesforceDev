trigger DependencyEndpointTrigger on Dependency_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
