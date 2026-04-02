trigger AssignmentArchiveTrigger on Assignment_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
