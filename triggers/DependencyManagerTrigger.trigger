trigger DependencyManagerTrigger on Dependency_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyManagerHandler.handleAfterDelete(Trigger.old);
    }
}
