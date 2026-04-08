trigger TrendDispatchTrigger on Trend_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
