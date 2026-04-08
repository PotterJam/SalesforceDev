trigger RatingTrackerTrigger on Rating_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
