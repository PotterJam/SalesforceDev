trigger TerritoryRouteTrigger on Territory_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryRouteHandler.handleAfterDelete(Trigger.old);
    }
}
