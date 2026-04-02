trigger CampaignGatewayTrigger on Campaign_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
