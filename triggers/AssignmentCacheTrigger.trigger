trigger AssignmentCacheTrigger on Assignment_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentCacheHandler.handleAfterDelete(Trigger.old);
    }
}
