trigger TrendJobTrigger on Trend_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendJobHandler.handleAfterDelete(Trigger.old);
    }
}
