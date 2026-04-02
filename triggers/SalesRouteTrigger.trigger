trigger SalesRouteTrigger on Sales_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesRouteHandler.handleAfterDelete(Trigger.old);
    }
}
