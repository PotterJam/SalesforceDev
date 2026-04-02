trigger PromotionHookTrigger on Promotion_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionHookHandler.handleAfterDelete(Trigger.old);
    }
}
