trigger CampaignJobTrigger on Campaign_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignJobHandler.handleAfterDelete(Trigger.old);
    }
}
