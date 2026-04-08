trigger WarehouseCatalogTrigger on Warehouse_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
