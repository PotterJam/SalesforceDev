trigger StatusAuditTrigger on Status_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusAuditHandler.handleAfterDelete(Trigger.old);
    }
}
