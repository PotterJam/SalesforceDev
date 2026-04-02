trigger DependencyViewTrigger on Dependency_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyViewHandler.handleAfterDelete(Trigger.old);
    }
}
