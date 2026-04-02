trigger PromotionDispatchTrigger on Promotion_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
