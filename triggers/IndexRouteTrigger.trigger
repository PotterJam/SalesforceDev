trigger IndexRouteTrigger on Index_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexRouteHandler.handleAfterDelete(Trigger.old);
    }
}
