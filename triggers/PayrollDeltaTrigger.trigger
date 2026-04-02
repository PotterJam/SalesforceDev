trigger PayrollDeltaTrigger on Payroll_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
