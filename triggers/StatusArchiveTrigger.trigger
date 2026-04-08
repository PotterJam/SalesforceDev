trigger StatusArchiveTrigger on Status_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
