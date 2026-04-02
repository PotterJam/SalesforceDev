trigger ProductCatalogTrigger on Product_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
