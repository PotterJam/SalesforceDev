trigger PromotionMappingTrigger on Promotion_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionMappingHandler.handleAfterDelete(Trigger.old);
    }
}
