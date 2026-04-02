trigger AssignmentRouteTrigger on Assignment_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentRouteHandler.handleAfterDelete(Trigger.old);
    }
}
