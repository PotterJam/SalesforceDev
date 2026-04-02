trigger PromotionViewTrigger on Promotion_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionViewHandler.handleAfterDelete(Trigger.old);
    }
}
