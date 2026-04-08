trigger EscalationControllerTrigger on Escalation_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationControllerHandler.handleAfterDelete(Trigger.old);
    }
}
