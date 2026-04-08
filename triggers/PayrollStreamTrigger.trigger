trigger PayrollStreamTrigger on Payroll_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollStreamHandler.handleAfterDelete(Trigger.old);
    }
}
