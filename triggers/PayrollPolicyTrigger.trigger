trigger PayrollPolicyTrigger on Payroll_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
