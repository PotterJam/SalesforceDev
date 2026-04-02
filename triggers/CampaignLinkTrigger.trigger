trigger CampaignLinkTrigger on Campaign_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignLinkHandler.handleAfterDelete(Trigger.old);
    }
}
