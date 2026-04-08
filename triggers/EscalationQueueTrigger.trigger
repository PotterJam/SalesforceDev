trigger EscalationQueueTrigger on Escalation_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationQueueHandler.handleAfterDelete(Trigger.old);
    }
}
