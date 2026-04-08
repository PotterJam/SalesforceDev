trigger PhaseCacheTrigger on Phase_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseCacheHandler.handleAfterDelete(Trigger.old);
    }
}
