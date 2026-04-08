trigger AllocationProcessTrigger on Allocation_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationProcessHandler.handleAfterDelete(Trigger.old);
    }
}
