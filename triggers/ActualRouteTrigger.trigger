trigger ActualRouteTrigger on Actual_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualRouteHandler.handleAfterDelete(Trigger.old);
    }
}
