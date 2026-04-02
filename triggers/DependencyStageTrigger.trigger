trigger DependencyStageTrigger on Dependency_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyStageHandler.handleAfterDelete(Trigger.old);
    }
}
