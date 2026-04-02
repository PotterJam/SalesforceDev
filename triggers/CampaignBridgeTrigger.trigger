trigger CampaignBridgeTrigger on Campaign_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
