trigger ImpactAuditTrigger on Impact_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactAuditHandler.handleAfterDelete(Trigger.old);
    }
}
