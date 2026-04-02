trigger CampaignTrackerTrigger on Campaign_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
