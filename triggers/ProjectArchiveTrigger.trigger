trigger ProjectArchiveTrigger on Project_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
