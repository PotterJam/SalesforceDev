trigger BenchmarkAggregateTrigger on Benchmark_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
