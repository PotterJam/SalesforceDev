trigger PromotionModelTrigger on Promotion_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionModelHandler.handleAfterDelete(Trigger.old);
    }
}
