trigger DependencyCacheTrigger on Dependency_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyCacheHandler.handleAfterDelete(Trigger.old);
    }
}
