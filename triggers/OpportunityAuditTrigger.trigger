trigger OpportunityAuditTrigger on Opportunity_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityAuditHandler.handleAfterDelete(Trigger.old);
    }
}
