trigger IssueStageTrigger on Issue_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueStageHandler.handleAfterDelete(Trigger.old);
    }
}
