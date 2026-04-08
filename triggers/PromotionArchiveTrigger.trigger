trigger PromotionArchiveTrigger on Promotion_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PromotionArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PromotionArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PromotionArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PromotionArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
