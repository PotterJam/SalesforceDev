trigger RiskCatalogTrigger on Risk_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
