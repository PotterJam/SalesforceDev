trigger ApprovalSummaryTrigger on Approval_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
