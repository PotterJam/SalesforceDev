trigger DurationStreamTrigger on Duration_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationStreamHandler.handleAfterDelete(Trigger.old);
    }
}
