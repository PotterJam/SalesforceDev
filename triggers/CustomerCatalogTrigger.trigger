trigger CustomerCatalogTrigger on Customer_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
