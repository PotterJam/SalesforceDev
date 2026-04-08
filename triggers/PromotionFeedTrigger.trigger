trigger PromotionFeedTrigger on Promotion_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionFeedHandler.handleAfterDelete(Trigger.old);
    }
}
