trigger PartnerCatalogTrigger on Partner_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
