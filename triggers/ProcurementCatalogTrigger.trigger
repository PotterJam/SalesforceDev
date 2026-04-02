trigger ProcurementCatalogTrigger on Procurement_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
