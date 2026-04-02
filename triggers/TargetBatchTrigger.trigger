trigger TargetBatchTrigger on Target_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetBatchHandler.handleAfterDelete(Trigger.old);
    }
}
