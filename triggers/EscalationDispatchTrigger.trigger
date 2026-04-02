trigger EscalationDispatchTrigger on Escalation_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
