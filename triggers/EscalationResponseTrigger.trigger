trigger EscalationResponseTrigger on Escalation_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationResponseHandler.handleAfterDelete(Trigger.old);
    }
}
