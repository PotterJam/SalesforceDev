trigger CampaignProcessTrigger on Campaign_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignProcessHandler.handleAfterDelete(Trigger.old);
    }
}
