trigger ActualCatalogTrigger on Actual_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
