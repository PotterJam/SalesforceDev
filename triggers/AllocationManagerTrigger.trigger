trigger AllocationManagerTrigger on Allocation_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationManagerHandler.handleAfterDelete(Trigger.old);
    }
}
