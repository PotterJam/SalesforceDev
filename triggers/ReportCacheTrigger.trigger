trigger ReportCacheTrigger on Report_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportCacheHandler.handleAfterDelete(Trigger.old);
    }
}
