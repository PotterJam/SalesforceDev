trigger EscalationProxyTrigger on Escalation_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationProxyHandler.handleAfterDelete(Trigger.old);
    }
}
