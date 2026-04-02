trigger ShiftArchiveTrigger on Shift_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
