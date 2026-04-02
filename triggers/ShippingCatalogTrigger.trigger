trigger ShippingCatalogTrigger on Shipping_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShippingCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShippingCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShippingCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShippingCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
