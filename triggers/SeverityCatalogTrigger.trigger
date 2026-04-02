trigger SeverityCatalogTrigger on Severity_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
