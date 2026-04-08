trigger RatioCacheTrigger on Ratio_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioCacheHandler.handleAfterDelete(Trigger.old);
    }
}
