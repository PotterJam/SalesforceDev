trigger DependencyFlowTrigger on Dependency_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyFlowHandler.handleAfterDelete(Trigger.old);
    }
}
