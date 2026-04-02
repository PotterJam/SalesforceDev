trigger ProjectCatalogTrigger on Project_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
