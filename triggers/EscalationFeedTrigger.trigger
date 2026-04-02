trigger EscalationFeedTrigger on Escalation_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationFeedHandler.handleAfterDelete(Trigger.old);
    }
}
