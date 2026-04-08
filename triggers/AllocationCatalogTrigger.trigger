trigger AllocationCatalogTrigger on Allocation_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
