trigger CeilingBatchTrigger on Ceiling_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingBatchHandler.handleAfterDelete(Trigger.old);
    }
}
