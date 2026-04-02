trigger ActualProcessTrigger on Actual_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualProcessHandler.handleAfterDelete(Trigger.old);
    }
}
