trigger DurationRouteTrigger on Duration_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationRouteHandler.handleAfterDelete(Trigger.old);
    }
}
