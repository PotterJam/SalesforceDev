trigger MarketingRouteTrigger on Marketing_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingRouteHandler.handleAfterDelete(Trigger.old);
    }
}
