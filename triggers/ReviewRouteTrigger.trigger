trigger ReviewRouteTrigger on Review_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewRouteHandler.handleAfterDelete(Trigger.old);
    }
}
