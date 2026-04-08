trigger CampaignBatchTrigger on Campaign_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignBatchHandler.handleAfterDelete(Trigger.old);
    }
}
