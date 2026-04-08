trigger PayrollJobTrigger on Payroll_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollJobHandler.handleAfterDelete(Trigger.old);
    }
}
