trigger EscalationTaskTrigger on Escalation_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTaskHandler.handleAfterDelete(Trigger.old);
    }
}
