trigger CampaignQueueTrigger on Campaign_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignQueueHandler.handleAfterDelete(Trigger.old);
    }
}
