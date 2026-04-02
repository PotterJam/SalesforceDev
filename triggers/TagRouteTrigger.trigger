trigger TagRouteTrigger on Tag_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagRouteHandler.handleAfterDelete(Trigger.old);
    }
}
