trigger PromotionTransformTrigger on Promotion_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionTransformHandler.handleAfterDelete(Trigger.old);
    }
}
