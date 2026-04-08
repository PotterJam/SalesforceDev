trigger LevelCatalogTrigger on Level_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
