trigger EscalationJobTrigger on Escalation_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationJobHandler.handleAfterDelete(Trigger.old);
    }
}
