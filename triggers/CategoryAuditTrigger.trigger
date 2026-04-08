trigger CategoryAuditTrigger on Category_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryAuditHandler.handleAfterDelete(Trigger.old);
    }
}
