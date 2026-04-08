trigger ShiftAuditTrigger on Shift_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftAuditHandler.handleAfterDelete(Trigger.old);
    }
}
