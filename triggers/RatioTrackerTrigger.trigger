trigger RatioTrackerTrigger on Ratio_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
