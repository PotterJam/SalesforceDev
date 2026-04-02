trigger PromotionServiceTrigger on Promotion_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionServiceHandler.handleAfterDelete(Trigger.old);
    }
}
