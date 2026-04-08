trigger PromotionStreamTrigger on Promotion_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionStreamHandler.handleAfterDelete(Trigger.old);
    }
}
