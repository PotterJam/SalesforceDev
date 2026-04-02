trigger FinanceBatchTrigger on Finance_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceBatchHandler.handleAfterDelete(Trigger.old);
    }
}
