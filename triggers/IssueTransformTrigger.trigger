trigger IssueTransformTrigger on Issue_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueTransformHandler.handleAfterDelete(Trigger.old);
    }
}
