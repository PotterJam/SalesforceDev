trigger PayrollTrackerTrigger on Payroll_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
