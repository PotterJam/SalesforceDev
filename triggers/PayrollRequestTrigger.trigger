trigger PayrollRequestTrigger on Payroll_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollRequestHandler.handleAfterDelete(Trigger.old);
    }
}
