trigger ProjectRouteTrigger on Project_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectRouteHandler.handleAfterDelete(Trigger.old);
    }
}
