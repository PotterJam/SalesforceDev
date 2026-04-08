trigger PromotionDetailTrigger on Promotion_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionDetailHandler.handleAfterDelete(Trigger.old);
    }
}
