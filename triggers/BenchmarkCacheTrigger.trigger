trigger BenchmarkCacheTrigger on Benchmark_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkCacheHandler.handleAfterDelete(Trigger.old);
    }
}
