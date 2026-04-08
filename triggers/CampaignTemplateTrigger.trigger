trigger CampaignTemplateTrigger on Campaign_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
