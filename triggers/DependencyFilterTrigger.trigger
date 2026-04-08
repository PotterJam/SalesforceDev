trigger DependencyFilterTrigger on Dependency_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyFilterHandler.handleAfterDelete(Trigger.old);
    }
}
