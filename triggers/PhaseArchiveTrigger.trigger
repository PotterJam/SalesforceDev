trigger PhaseArchiveTrigger on Phase_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
