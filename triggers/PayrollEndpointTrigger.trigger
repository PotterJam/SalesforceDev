trigger PayrollEndpointTrigger on Payroll_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
