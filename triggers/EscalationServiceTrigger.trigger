trigger EscalationServiceTrigger on Escalation_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationServiceHandler.handleAfterDelete(Trigger.old);
    }
}
