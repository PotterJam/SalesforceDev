trigger DependencyProxyTrigger on Dependency_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyProxyHandler.handleAfterDelete(Trigger.old);
    }
}
