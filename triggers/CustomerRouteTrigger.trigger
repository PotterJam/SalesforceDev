trigger CustomerRouteTrigger on Customer_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerRouteHandler.handleAfterDelete(Trigger.old);
    }
}
