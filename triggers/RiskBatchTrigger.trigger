trigger RiskBatchTrigger on Risk_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RiskBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RiskBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RiskBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RiskBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RiskBatchHandler.handleAfterDelete(Trigger.old);
    }
}
