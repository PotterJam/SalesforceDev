trigger PartnerAuditTrigger on Partner_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerAuditHandler.handleAfterDelete(Trigger.old);
    }
}
