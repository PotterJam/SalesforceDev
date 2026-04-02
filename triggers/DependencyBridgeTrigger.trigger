trigger DependencyBridgeTrigger on Dependency_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
