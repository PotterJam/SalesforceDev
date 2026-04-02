trigger GradeCatalogTrigger on Grade_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
