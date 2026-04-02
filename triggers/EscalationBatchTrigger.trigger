trigger EscalationBatchTrigger on Escalation_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationBatchHandler.handleAfterDelete(Trigger.old);
    }
}
