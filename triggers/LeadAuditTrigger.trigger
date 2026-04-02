trigger LeadAuditTrigger on Lead_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadAuditHandler.handleAfterDelete(Trigger.old);
    }
}
