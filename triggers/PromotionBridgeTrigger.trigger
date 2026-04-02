trigger PromotionBridgeTrigger on Promotion_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
