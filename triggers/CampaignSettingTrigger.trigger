trigger CampaignSettingTrigger on Campaign_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignSettingHandler.handleAfterDelete(Trigger.old);
    }
}
