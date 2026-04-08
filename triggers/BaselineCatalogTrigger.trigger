trigger BaselineCatalogTrigger on Baseline_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
