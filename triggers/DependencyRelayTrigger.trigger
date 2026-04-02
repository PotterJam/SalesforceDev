trigger DependencyRelayTrigger on Dependency_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyRelayHandler.handleAfterDelete(Trigger.old);
    }
}
