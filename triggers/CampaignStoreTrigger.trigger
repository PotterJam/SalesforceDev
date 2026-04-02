trigger CampaignStoreTrigger on Campaign_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignStoreHandler.handleAfterDelete(Trigger.old);
    }
}
