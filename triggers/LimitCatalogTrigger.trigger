trigger LimitCatalogTrigger on Limit_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
