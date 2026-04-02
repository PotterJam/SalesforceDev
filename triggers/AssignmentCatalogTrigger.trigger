trigger AssignmentCatalogTrigger on Assignment_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
