trigger DeliverableTrackerTrigger on Deliverable_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
