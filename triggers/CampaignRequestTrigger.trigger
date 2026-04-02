trigger CampaignRequestTrigger on Campaign_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignRequestHandler.handleAfterDelete(Trigger.old);
    }
}
