trigger PayrollArchiveTrigger on Payroll_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
