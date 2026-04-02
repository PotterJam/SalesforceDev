trigger CampaignDispatchTrigger on Campaign_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
