trigger PromotionPluginTrigger on Promotion_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionPluginHandler.handleAfterDelete(Trigger.old);
    }
}
