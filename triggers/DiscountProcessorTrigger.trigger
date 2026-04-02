trigger DiscountProcessorTrigger on Discount_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DiscountProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DiscountProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DiscountProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DiscountProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
