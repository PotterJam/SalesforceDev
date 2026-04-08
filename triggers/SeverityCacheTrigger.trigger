trigger SeverityCacheTrigger on Severity_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SeverityCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SeverityCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SeverityCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SeverityCacheHandler.handleAfterDelete(Trigger.old);
    }
}
