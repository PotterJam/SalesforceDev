trigger TrendResponseTrigger on Trend_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendResponseHandler.handleAfterDelete(Trigger.old);
    }
}
