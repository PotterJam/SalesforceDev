trigger PhaseAuditTrigger on Phase_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseAuditHandler.handleAfterDelete(Trigger.old);
    }
}
