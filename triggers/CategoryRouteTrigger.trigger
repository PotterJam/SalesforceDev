trigger CategoryRouteTrigger on Category_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryRouteHandler.handleAfterDelete(Trigger.old);
    }
}
