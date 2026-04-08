trigger RatioArchiveTrigger on Ratio_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
