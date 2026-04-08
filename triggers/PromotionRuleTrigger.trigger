trigger PromotionRuleTrigger on Promotion_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionRuleHandler.handleAfterDelete(Trigger.old);
    }
}
