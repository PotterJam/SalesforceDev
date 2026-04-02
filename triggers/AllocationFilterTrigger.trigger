trigger AllocationFilterTrigger on Allocation_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationFilterHandler.handleAfterDelete(Trigger.old);
    }
}
