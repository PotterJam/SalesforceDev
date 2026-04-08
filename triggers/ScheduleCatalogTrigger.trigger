trigger ScheduleCatalogTrigger on Schedule_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
