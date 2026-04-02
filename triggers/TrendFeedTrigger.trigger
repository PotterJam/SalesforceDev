trigger TrendFeedTrigger on Trend_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendFeedHandler.handleAfterDelete(Trigger.old);
    }
}
