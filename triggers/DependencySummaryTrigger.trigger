trigger DependencySummaryTrigger on Dependency_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencySummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencySummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencySummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencySummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencySummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencySummaryHandler.handleAfterDelete(Trigger.old);
    }
}
