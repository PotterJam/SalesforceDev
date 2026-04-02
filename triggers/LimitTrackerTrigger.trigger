trigger LimitTrackerTrigger on Limit_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
