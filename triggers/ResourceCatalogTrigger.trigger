trigger ResourceCatalogTrigger on Resource_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
