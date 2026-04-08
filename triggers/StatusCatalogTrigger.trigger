trigger StatusCatalogTrigger on Status_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
