trigger PayrollLinkTrigger on Payroll_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollLinkHandler.handleAfterDelete(Trigger.old);
    }
}
