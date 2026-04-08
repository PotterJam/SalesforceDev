trigger PriorityCatalogTrigger on Priority_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
