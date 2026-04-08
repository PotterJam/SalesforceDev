trigger PromotionGatewayTrigger on Promotion_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
