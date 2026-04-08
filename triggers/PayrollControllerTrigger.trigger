trigger PayrollControllerTrigger on Payroll_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollControllerHandler.handleAfterDelete(Trigger.old);
    }
}
