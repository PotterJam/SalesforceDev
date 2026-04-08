trigger BenchmarkStreamTrigger on Benchmark_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkStreamHandler.handleAfterDelete(Trigger.old);
    }
}
