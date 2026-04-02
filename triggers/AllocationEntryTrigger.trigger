trigger AllocationEntryTrigger on Allocation_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationEntryHandler.handleAfterDelete(Trigger.old);
    }
}
