trigger ProcurementAuditTrigger on Procurement_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementAuditHandler.handleAfterDelete(Trigger.old);
    }
}
