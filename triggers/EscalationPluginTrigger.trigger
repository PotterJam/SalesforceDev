trigger EscalationPluginTrigger on Escalation_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationPluginHandler.handleAfterDelete(Trigger.old);
    }
}
