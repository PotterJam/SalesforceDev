trigger PromotionRequestTrigger on Promotion_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionRequestHandler.handleAfterDelete(Trigger.old);
    }
}
