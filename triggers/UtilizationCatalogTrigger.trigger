trigger UtilizationCatalogTrigger on Utilization_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
