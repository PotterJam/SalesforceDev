trigger DiscountArchiveTrigger on Discount_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
