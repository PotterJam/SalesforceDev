trigger DependencyModelTrigger on Dependency_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyModelHandler.handleAfterDelete(Trigger.old);
    }
}
