trigger PromotionTemplateTrigger on Promotion_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
