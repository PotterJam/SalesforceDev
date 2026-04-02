trigger RatioCatalogTrigger on Ratio_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
