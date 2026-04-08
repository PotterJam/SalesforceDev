trigger CampaignBindingTrigger on Campaign_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignBindingHandler.handleAfterDelete(Trigger.old);
    }
}
