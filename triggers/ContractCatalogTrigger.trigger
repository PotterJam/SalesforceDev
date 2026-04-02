trigger ContractCatalogTrigger on Contract_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
