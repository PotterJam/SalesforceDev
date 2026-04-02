trigger IssueProxyTrigger on Issue_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueProxyHandler.handleAfterDelete(Trigger.old);
    }
}
