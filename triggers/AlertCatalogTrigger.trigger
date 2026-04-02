trigger AlertCatalogTrigger on Alert_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
