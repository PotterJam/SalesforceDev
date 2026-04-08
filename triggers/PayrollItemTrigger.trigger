trigger PayrollItemTrigger on Payroll_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollItemHandler.handleAfterDelete(Trigger.old);
    }
}
