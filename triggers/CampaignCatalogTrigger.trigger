trigger CampaignCatalogTrigger on Campaign_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
