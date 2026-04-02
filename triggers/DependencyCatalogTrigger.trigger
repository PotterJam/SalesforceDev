trigger DependencyCatalogTrigger on Dependency_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DependencyCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DependencyCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DependencyCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DependencyCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
