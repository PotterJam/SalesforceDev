trigger IssueFeedTrigger on Issue_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueFeedHandler.handleAfterDelete(Trigger.old);
    }
}
