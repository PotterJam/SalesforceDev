trigger CampaignAggregateTrigger on Campaign_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
