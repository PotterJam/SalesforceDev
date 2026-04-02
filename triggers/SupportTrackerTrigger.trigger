trigger SupportTrackerTrigger on Support_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
