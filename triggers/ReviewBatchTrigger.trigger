trigger ReviewBatchTrigger on Review_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewBatchHandler.handleAfterDelete(Trigger.old);
    }
}
