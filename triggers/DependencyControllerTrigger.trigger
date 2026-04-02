trigger DependencyControllerTrigger on Dependency_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyControllerHandler.handleAfterDelete(Trigger.old);
    }
}
