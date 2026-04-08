trigger PromotionDeltaTrigger on Promotion_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
