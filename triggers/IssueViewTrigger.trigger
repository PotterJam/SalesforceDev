trigger IssueViewTrigger on Issue_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueViewHandler.handleAfterDelete(Trigger.old);
    }
}
