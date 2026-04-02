trigger EscalationEntryTrigger on Escalation_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationEntryHandler.handleAfterDelete(Trigger.old);
    }
}
