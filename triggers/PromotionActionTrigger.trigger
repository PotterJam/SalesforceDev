trigger PromotionActionTrigger on Promotion_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionActionHandler.handleAfterDelete(Trigger.old);
    }
}
