trigger CeilingArchiveTrigger on Ceiling_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
