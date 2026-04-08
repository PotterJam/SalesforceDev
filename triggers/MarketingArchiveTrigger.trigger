trigger MarketingArchiveTrigger on Marketing_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
