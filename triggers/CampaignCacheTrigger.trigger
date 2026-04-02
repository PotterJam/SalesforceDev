trigger CampaignCacheTrigger on Campaign_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignCacheHandler.handleAfterDelete(Trigger.old);
    }
}
