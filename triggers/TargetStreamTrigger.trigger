trigger TargetStreamTrigger on Target_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetStreamHandler.handleAfterDelete(Trigger.old);
    }
}
