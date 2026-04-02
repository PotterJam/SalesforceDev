trigger CampaignSchemaTrigger on Campaign_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
