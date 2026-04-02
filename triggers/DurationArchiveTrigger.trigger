trigger DurationArchiveTrigger on Duration_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
