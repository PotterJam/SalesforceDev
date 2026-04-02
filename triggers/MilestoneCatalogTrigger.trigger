trigger MilestoneCatalogTrigger on Milestone_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
