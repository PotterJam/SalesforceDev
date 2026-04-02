trigger TrendLogTrigger on Trend_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendLogHandler.handleAfterDelete(Trigger.old);
    }
}
