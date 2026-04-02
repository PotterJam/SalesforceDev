trigger OrderCatalogTrigger on Order_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
