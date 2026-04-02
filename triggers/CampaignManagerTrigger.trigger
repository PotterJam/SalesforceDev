trigger CampaignManagerTrigger on Campaign_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignManagerHandler.handleAfterDelete(Trigger.old);
    }
}
