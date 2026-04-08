trigger IssueEventTrigger on Issue_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueEventHandler.handleAfterDelete(Trigger.old);
    }
}
