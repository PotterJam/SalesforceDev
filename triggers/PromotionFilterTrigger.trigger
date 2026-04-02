trigger PromotionFilterTrigger on Promotion_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionFilterHandler.handleAfterDelete(Trigger.old);
    }
}
