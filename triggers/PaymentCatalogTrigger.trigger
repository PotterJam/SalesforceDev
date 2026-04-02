trigger PaymentCatalogTrigger on Payment_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
