trigger TargetArchiveTrigger on Target_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
