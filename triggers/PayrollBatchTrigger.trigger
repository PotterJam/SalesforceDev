trigger PayrollBatchTrigger on Payroll_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollBatchHandler.handleAfterDelete(Trigger.old);
    }
}
