trigger IssueBackupTrigger on Issue_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueBackupHandler.handleAfterDelete(Trigger.old);
    }
}
