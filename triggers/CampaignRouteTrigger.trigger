trigger CampaignRouteTrigger on Campaign_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignRouteHandler.handleAfterDelete(Trigger.old);
    }
}
