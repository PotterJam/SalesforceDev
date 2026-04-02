trigger EscalationFlowTrigger on Escalation_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationFlowHandler.handleAfterDelete(Trigger.old);
    }
}
