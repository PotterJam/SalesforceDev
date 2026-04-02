trigger AllocationSummaryTrigger on Allocation_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AllocationSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AllocationSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AllocationSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AllocationSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
