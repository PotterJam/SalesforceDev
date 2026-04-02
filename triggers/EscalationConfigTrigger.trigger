trigger EscalationConfigTrigger on Escalation_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationConfigHandler.handleAfterDelete(Trigger.old);
    }
}
