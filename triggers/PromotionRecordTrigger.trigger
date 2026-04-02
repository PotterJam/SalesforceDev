trigger PromotionRecordTrigger on Promotion_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionRecordHandler.handleAfterDelete(Trigger.old);
    }
}
