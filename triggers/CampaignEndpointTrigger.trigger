trigger CampaignEndpointTrigger on Campaign_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
