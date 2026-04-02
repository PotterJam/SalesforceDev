trigger TrendArchiveTrigger on Trend_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
