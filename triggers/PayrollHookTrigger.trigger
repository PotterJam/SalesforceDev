trigger PayrollHookTrigger on Payroll_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollHookHandler.handleAfterDelete(Trigger.old);
    }
}
