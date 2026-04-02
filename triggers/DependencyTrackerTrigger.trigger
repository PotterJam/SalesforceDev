trigger DependencyTrackerTrigger on Dependency_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
