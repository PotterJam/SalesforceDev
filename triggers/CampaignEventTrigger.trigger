trigger CampaignEventTrigger on Campaign_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignEventHandler.handleAfterDelete(Trigger.old);
    }
}
