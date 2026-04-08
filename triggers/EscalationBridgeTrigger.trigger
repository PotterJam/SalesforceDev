trigger EscalationBridgeTrigger on Escalation_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
