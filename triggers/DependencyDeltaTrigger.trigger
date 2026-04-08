trigger DependencyDeltaTrigger on Dependency_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
