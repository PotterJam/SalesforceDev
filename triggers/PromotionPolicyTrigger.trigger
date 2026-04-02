trigger PromotionPolicyTrigger on Promotion_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
