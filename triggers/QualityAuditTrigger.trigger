trigger QualityAuditTrigger on Quality_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityAuditHandler.handleAfterDelete(Trigger.old);
    }
}
