trigger EscalationManagerTrigger on Escalation_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationManagerHandler.handleAfterDelete(Trigger.old);
    }
}
