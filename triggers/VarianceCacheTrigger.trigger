trigger VarianceCacheTrigger on Variance_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceCacheHandler.handleAfterDelete(Trigger.old);
    }
}
