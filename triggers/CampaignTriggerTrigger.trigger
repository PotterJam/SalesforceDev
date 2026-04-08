trigger CampaignTriggerTrigger on Campaign_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
