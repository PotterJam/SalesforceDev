trigger PayrollServiceTrigger on Payroll_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollServiceHandler.handleAfterDelete(Trigger.old);
    }
}
