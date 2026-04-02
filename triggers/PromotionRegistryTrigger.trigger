trigger PromotionRegistryTrigger on Promotion_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
