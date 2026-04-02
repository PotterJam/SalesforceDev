trigger LogisticsRouteTrigger on Logistics_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsRouteHandler.handleAfterDelete(Trigger.old);
    }
}
