trigger BenchmarkResponseTrigger on Benchmark_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkResponseHandler.handleAfterDelete(Trigger.old);
    }
}
