trigger LabelAuditTrigger on Label_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelAuditHandler.handleAfterDelete(Trigger.old);
    }
}
