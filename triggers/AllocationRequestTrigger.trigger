trigger AllocationRequestTrigger on Allocation_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationRequestHandler.handleAfterDelete(Trigger.old);
    }
}
