trigger PayrollStageTrigger on Payroll_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollStageHandler.handleAfterDelete(Trigger.old);
    }
}
