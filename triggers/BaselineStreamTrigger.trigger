trigger BaselineStreamTrigger on Baseline_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineStreamHandler.handleAfterDelete(Trigger.old);
    }
}
