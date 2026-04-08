trigger EscalationSchemaTrigger on Escalation_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
