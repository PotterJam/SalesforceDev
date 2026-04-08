trigger RangeCatalogTrigger on Range_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
