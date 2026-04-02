trigger CampaignModuleTrigger on Campaign_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignModuleHandler.handleAfterDelete(Trigger.old);
    }
}
