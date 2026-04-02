trigger PayrollViewTrigger on Payroll_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollViewHandler.handleAfterDelete(Trigger.old);
    }
}
