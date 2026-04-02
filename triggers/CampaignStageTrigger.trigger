trigger CampaignStageTrigger on Campaign_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignStageHandler.handleAfterDelete(Trigger.old);
    }
}
