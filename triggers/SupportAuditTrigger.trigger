trigger SupportAuditTrigger on Support_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportAuditHandler.handleAfterDelete(Trigger.old);
    }
}
