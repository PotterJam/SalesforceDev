trigger FinanceCatalogTrigger on Finance_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
