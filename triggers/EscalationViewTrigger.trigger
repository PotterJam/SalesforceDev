trigger EscalationViewTrigger on Escalation_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationViewHandler.handleAfterDelete(Trigger.old);
    }
}
