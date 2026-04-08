trigger PromotionEntryTrigger on Promotion_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionEntryHandler.handleAfterDelete(Trigger.old);
    }
}
