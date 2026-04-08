trigger SeverityFeedTrigger on Severity_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityFeedHandler.handleAfterDelete(Trigger.old);
    }
}
