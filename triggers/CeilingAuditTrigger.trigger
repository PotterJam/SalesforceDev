trigger CeilingAuditTrigger on Ceiling_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingAuditHandler.handleAfterDelete(Trigger.old);
    }
}
