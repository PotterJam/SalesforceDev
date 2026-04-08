trigger DeliverableRouteTrigger on Deliverable_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRouteHandler.handleAfterDelete(Trigger.old);
    }
}
