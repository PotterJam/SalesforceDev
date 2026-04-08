trigger MarketingCatalogTrigger on Marketing_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
