trigger BaselineLogTrigger on Baseline_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineLogHandler.handleAfterDelete(Trigger.old);
    }
}
