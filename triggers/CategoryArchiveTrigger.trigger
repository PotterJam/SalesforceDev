trigger CategoryArchiveTrigger on Category_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
