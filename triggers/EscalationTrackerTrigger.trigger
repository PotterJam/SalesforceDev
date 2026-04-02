trigger EscalationTrackerTrigger on Escalation_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
