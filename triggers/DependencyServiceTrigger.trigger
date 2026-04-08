trigger DependencyServiceTrigger on Dependency_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyServiceHandler.handleAfterDelete(Trigger.old);
    }
}
