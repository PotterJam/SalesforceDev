trigger DependencyTransformTrigger on Dependency_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyTransformHandler.handleAfterDelete(Trigger.old);
    }
}
