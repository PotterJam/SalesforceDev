trigger IssueTrackerTrigger on Issue_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
