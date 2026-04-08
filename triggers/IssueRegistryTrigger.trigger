trigger IssueRegistryTrigger on Issue_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
