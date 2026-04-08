trigger EscalationHandlerTrigger on Escalation_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
