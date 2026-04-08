trigger PromotionResponseTrigger on Promotion_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionResponseHandler.handleAfterDelete(Trigger.old);
    }
}
