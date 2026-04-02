trigger CampaignSummaryTrigger on Campaign_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
