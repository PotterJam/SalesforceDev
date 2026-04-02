trigger CampaignArchiveTrigger on Campaign_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
