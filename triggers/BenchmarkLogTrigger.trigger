trigger BenchmarkLogTrigger on Benchmark_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkLogHandler.handleAfterDelete(Trigger.old);
    }
}
