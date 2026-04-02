trigger PayrollProcessTrigger on Payroll_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollProcessHandler.handleAfterDelete(Trigger.old);
    }
}
