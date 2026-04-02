trigger BenchmarkBatchTrigger on Benchmark_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkBatchHandler.handleAfterDelete(Trigger.old);
    }
}
