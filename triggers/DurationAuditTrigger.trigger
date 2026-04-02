trigger DurationAuditTrigger on Duration_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationAuditHandler.handleAfterDelete(Trigger.old);
    }
}
