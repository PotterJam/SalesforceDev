trigger EscalationSummaryTrigger on Escalation_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
