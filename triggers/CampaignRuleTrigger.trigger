trigger CampaignRuleTrigger on Campaign_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignRuleHandler.handleAfterDelete(Trigger.old);
    }
}
