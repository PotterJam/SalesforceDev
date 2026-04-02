trigger TargetCacheTrigger on Target_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetCacheHandler.handleAfterDelete(Trigger.old);
    }
}
