trigger TrendProcessTrigger on Trend_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendProcessHandler.handleAfterDelete(Trigger.old);
    }
}
