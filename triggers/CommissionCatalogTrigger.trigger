trigger CommissionCatalogTrigger on Commission_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
