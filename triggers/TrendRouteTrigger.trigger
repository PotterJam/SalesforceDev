trigger TrendRouteTrigger on Trend_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendRouteHandler.handleAfterDelete(Trigger.old);
    }
}
