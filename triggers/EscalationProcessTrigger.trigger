trigger EscalationProcessTrigger on Escalation_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationProcessHandler.handleAfterDelete(Trigger.old);
    }
}
