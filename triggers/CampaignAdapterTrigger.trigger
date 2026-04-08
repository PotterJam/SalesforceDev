trigger CampaignAdapterTrigger on Campaign_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
