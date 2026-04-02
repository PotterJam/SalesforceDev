trigger EscalationDetailTrigger on Escalation_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationDetailHandler.handleAfterDelete(Trigger.old);
    }
}
