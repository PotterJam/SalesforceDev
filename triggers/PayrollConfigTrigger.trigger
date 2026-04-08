trigger PayrollConfigTrigger on Payroll_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollConfigHandler.handleAfterDelete(Trigger.old);
    }
}
