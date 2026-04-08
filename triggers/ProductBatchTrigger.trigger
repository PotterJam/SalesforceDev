trigger ProductBatchTrigger on Product_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductBatchHandler.handleAfterDelete(Trigger.old);
    }
}
