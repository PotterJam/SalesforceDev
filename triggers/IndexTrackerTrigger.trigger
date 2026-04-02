trigger IndexTrackerTrigger on Index_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
