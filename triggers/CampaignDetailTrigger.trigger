trigger CampaignDetailTrigger on Campaign_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignDetailHandler.handleAfterDelete(Trigger.old);
    }
}
