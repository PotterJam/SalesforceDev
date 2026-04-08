trigger RiskFeedTrigger on Risk_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskFeedHandler.handleAfterDelete(Trigger.old);
    }
}
