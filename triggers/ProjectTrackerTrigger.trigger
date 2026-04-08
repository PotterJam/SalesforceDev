trigger ProjectTrackerTrigger on Project_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
