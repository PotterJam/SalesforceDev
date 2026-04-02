trigger PayrollTransactionTrigger on Payroll_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
