trigger CampaignMappingTrigger on Campaign_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignMappingHandler.handleAfterDelete(Trigger.old);
    }
}
