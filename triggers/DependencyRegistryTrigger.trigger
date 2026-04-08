trigger DependencyRegistryTrigger on Dependency_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
