trigger AllocationArchiveTrigger on Allocation_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
