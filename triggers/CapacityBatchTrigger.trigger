trigger CapacityBatchTrigger on Capacity_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityBatchHandler.handleAfterDelete(Trigger.old);
    }
}
