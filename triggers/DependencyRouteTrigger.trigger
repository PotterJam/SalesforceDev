trigger DependencyRouteTrigger on Dependency_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyRouteHandler.handleAfterDelete(Trigger.old);
    }
}
