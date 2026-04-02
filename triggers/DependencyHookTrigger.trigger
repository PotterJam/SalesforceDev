trigger DependencyHookTrigger on Dependency_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyHookHandler.handleAfterDelete(Trigger.old);
    }
}
