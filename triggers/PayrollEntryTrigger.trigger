trigger PayrollEntryTrigger on Payroll_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollEntryHandler.handleAfterDelete(Trigger.old);
    }
}
