trigger QuotaArchiveTrigger on Quota_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
