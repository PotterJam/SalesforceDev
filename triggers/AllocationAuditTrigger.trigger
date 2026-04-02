trigger AllocationAuditTrigger on Allocation_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationAuditHandler.handleAfterDelete(Trigger.old);
    }
}
