trigger QuotaCatalogTrigger on Quota_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
