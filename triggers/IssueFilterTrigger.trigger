trigger IssueFilterTrigger on Issue_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueFilterHandler.handleAfterDelete(Trigger.old);
    }
}
