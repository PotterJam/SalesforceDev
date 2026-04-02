trigger PayrollRecordTrigger on Payroll_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollRecordHandler.handleAfterDelete(Trigger.old);
    }
}
