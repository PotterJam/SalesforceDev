trigger MilestoneAuditTrigger on Milestone_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneAuditHandler.handleAfterDelete(Trigger.old);
    }
}
