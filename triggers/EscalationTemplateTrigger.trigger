trigger EscalationTemplateTrigger on Escalation_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
