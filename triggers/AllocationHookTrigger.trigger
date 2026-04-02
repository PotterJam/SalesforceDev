trigger AllocationHookTrigger on Allocation_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationHookHandler.handleAfterDelete(Trigger.old);
    }
}
