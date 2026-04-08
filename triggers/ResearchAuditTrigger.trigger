trigger ResearchAuditTrigger on Research_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchAuditHandler.handleAfterDelete(Trigger.old);
    }
}
