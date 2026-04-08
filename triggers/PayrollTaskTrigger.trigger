trigger PayrollTaskTrigger on Payroll_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollTaskHandler.handleAfterDelete(Trigger.old);
    }
}
