trigger TrendHandlerTrigger on Trend_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
