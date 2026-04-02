trigger MarketingTrackerTrigger on Marketing_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
