trigger UtilizationBatchTrigger on Utilization_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationBatchHandler.handleAfterDelete(Trigger.old);
    }
}
