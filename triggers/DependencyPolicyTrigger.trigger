trigger DependencyPolicyTrigger on Dependency_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
