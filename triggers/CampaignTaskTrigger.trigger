trigger CampaignTaskTrigger on Campaign_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTaskHandler.handleAfterDelete(Trigger.old);
    }
}
