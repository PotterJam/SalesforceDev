trigger CampaignHubTrigger on Campaign_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignHubHandler.handleAfterDelete(Trigger.old);
    }
}
