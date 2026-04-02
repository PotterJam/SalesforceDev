trigger PayrollGatewayTrigger on Payroll_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
