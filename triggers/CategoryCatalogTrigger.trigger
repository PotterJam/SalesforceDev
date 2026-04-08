trigger CategoryCatalogTrigger on Category_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
