trigger AllocationProcessorTrigger on Allocation_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
