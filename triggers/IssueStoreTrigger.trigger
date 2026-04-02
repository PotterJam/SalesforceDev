trigger IssueStoreTrigger on Issue_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueStoreHandler.handleAfterDelete(Trigger.old);
    }
}
