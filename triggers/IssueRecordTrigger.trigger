trigger IssueRecordTrigger on Issue_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueRecordHandler.handleAfterDelete(Trigger.old);
    }
}
