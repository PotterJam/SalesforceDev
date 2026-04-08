trigger CampaignRegistryTrigger on Campaign_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
