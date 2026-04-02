trigger PayrollSchemaTrigger on Payroll_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
