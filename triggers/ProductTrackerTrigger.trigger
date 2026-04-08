trigger ProductTrackerTrigger on Product_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
