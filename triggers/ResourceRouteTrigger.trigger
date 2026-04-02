trigger ResourceRouteTrigger on Resource_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceRouteHandler.handleAfterDelete(Trigger.old);
    }
}
