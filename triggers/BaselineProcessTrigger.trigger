trigger BaselineProcessTrigger on Baseline_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineProcessHandler.handleAfterDelete(Trigger.old);
    }
}
