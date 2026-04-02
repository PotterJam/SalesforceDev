trigger TrendCatalogTrigger on Trend_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
