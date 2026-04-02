trigger PayrollBridgeTrigger on Payroll_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
