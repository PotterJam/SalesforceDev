trigger CustomerAuditTrigger on Customer_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerAuditHandler.handleAfterDelete(Trigger.old);
    }
}
