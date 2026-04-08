trigger PayrollProxyTrigger on Payroll_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollProxyHandler.handleAfterDelete(Trigger.old);
    }
}
