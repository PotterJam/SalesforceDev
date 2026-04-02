trigger PayrollEventTrigger on Payroll_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollEventHandler.handleAfterDelete(Trigger.old);
    }
}
