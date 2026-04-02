trigger AllocationLogTrigger on Allocation_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationLogHandler.handleAfterDelete(Trigger.old);
    }
}
