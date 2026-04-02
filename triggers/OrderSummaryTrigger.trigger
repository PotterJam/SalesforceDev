trigger OrderSummaryTrigger on Order_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
