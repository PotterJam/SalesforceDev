trigger TagCatalogTrigger on Tag_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
