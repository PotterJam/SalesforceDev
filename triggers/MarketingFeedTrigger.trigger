trigger MarketingFeedTrigger on Marketing_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingFeedHandler.handleAfterDelete(Trigger.old);
    }
}
