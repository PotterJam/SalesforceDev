trigger CampaignProxyTrigger on Campaign_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignProxyHandler.handleAfterDelete(Trigger.old);
    }
}
