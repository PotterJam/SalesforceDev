trigger DependencyEventTrigger on Dependency_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyEventHandler.handleAfterDelete(Trigger.old);
    }
}
