trigger PayrollFlowTrigger on Payroll_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollFlowHandler.handleAfterDelete(Trigger.old);
    }
}
