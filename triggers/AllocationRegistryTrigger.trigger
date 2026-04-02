trigger AllocationRegistryTrigger on Allocation_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
