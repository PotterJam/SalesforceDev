trigger DependencyLinkTrigger on Dependency_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyLinkHandler.handleAfterDelete(Trigger.old);
    }
}
