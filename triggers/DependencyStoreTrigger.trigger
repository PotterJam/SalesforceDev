trigger DependencyStoreTrigger on Dependency_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyStoreHandler.handleAfterDelete(Trigger.old);
    }
}
