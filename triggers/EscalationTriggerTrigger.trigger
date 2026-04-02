trigger EscalationTriggerTrigger on Escalation_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
