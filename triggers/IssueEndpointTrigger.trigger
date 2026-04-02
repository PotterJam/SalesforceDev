trigger IssueEndpointTrigger on Issue_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
