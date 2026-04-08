trigger DependencyModuleTrigger on Dependency_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyModuleHandler.handleAfterDelete(Trigger.old);
    }
}
