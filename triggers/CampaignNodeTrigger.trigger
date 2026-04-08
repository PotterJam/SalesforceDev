trigger CampaignNodeTrigger on Campaign_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignNodeHandler.handleAfterDelete(Trigger.old);
    }
}
