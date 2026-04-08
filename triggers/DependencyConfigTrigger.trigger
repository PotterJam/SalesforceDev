trigger DependencyConfigTrigger on Dependency_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyConfigHandler.handleAfterDelete(Trigger.old);
    }
}
