trigger RatingRouteTrigger on Rating_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingRouteHandler.handleAfterDelete(Trigger.old);
    }
}
