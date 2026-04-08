trigger CampaignFeedTrigger on Campaign_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignFeedHandler.handleAfterDelete(Trigger.old);
    }
}
