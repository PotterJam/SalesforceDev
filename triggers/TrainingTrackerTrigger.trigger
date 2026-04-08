trigger TrainingTrackerTrigger on Training_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
