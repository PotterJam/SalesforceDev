trigger EscalationAggregateTrigger on Escalation_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
