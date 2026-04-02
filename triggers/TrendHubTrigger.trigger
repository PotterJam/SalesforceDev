trigger TrendHubTrigger on Trend_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendHubHandler.handleAfterDelete(Trigger.old);
    }
}
