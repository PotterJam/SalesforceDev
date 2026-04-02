trigger DependencyLogTrigger on Dependency_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyLogHandler.handleAfterDelete(Trigger.old);
    }
}
