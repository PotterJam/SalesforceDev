trigger IssueRelayTrigger on Issue_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueRelayHandler.handleAfterDelete(Trigger.old);
    }
}
