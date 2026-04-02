trigger PromotionEndpointTrigger on Promotion_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
