trigger PromotionCatalogTrigger on Promotion_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
