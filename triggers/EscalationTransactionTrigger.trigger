trigger EscalationTransactionTrigger on Escalation_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
