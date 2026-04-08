trigger PromotionAdapterTrigger on Promotion_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
