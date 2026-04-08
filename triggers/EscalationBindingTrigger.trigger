trigger EscalationBindingTrigger on Escalation_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationBindingHandler.handleAfterDelete(Trigger.old);
    }
}
