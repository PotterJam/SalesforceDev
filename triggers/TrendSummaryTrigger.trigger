trigger TrendSummaryTrigger on Trend_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
