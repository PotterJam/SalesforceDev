trigger ScoreCacheTrigger on Score_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreCacheHandler.handleAfterDelete(Trigger.old);
    }
}
