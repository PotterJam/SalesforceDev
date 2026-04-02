trigger CategoryTrackerTrigger on Category_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
