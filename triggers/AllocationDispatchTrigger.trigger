trigger AllocationDispatchTrigger on Allocation_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
