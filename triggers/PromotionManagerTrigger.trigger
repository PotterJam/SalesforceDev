trigger PromotionManagerTrigger on Promotion_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionManagerHandler.handleAfterDelete(Trigger.old);
    }
}
