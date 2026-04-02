trigger BenchmarkFeedTrigger on Benchmark_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkFeedHandler.handleAfterDelete(Trigger.old);
    }
}
