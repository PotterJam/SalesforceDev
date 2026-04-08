trigger AnalyticsCatalogTrigger on Analytics_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
