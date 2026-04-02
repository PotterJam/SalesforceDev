trigger CampaignActionTrigger on Campaign_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignActionHandler.handleAfterDelete(Trigger.old);
    }
}
