trigger TierTrackerTrigger on Tier_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
