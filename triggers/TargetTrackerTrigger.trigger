trigger TargetTrackerTrigger on Target_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
