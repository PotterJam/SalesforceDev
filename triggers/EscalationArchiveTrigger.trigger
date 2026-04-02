trigger EscalationArchiveTrigger on Escalation_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
