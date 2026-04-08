trigger SalesCatalogTrigger on Sales_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
