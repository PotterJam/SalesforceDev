trigger ProjectCacheTrigger on Project_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectCacheHandler.handleAfterDelete(Trigger.old);
    }
}
