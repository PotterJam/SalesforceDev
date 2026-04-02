trigger PayrollStoreTrigger on Payroll_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollStoreHandler.handleAfterDelete(Trigger.old);
    }
}
