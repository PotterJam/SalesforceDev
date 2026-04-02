trigger PromotionFlowTrigger on Promotion_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionFlowHandler.handleAfterDelete(Trigger.old);
    }
}
