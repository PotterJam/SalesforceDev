trigger IssueActionTrigger on Issue_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueActionHandler.handleAfterDelete(Trigger.old);
    }
}
