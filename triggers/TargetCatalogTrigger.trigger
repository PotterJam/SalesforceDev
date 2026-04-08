trigger TargetCatalogTrigger on Target_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
