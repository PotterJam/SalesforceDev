trigger IssueConnectorTrigger on Issue_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
