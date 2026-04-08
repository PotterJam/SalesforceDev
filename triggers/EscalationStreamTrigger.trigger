trigger EscalationStreamTrigger on Escalation_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationStreamHandler.handleAfterDelete(Trigger.old);
    }
}
