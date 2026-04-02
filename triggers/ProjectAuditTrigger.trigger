trigger ProjectAuditTrigger on Project_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectAuditHandler.handleAfterDelete(Trigger.old);
    }
}
