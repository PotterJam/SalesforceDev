trigger PhaseCatalogTrigger on Phase_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
