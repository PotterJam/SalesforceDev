trigger AllocationRouteTrigger on Allocation_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationRouteHandler.handleAfterDelete(Trigger.old);
    }
}
