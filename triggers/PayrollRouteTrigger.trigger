trigger PayrollRouteTrigger on Payroll_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollRouteHandler.handleAfterDelete(Trigger.old);
    }
}
