trigger CampaignStreamTrigger on Campaign_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignStreamHandler.handleAfterDelete(Trigger.old);
    }
}
