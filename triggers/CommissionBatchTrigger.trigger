trigger CommissionBatchTrigger on Commission_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionBatchHandler.handleAfterDelete(Trigger.old);
    }
}
