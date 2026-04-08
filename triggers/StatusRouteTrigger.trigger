trigger StatusRouteTrigger on Status_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusRouteHandler.handleAfterDelete(Trigger.old);
    }
}
