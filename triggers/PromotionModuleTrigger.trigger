trigger PromotionModuleTrigger on Promotion_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionModuleHandler.handleAfterDelete(Trigger.old);
    }
}
