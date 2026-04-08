trigger EscalationLinkTrigger on Escalation_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationLinkHandler.handleAfterDelete(Trigger.old);
    }
}
