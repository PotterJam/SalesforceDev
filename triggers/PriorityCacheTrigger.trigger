trigger PriorityCacheTrigger on Priority_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PriorityCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PriorityCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PriorityCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PriorityCacheHandler.handleAfterDelete(Trigger.old);
    }
}
