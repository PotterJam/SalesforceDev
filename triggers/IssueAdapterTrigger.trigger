trigger IssueAdapterTrigger on Issue_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
