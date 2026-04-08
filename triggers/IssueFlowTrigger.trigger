trigger IssueFlowTrigger on Issue_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueFlowHandler.handleAfterDelete(Trigger.old);
    }
}
