trigger BenchmarkDetailTrigger on Benchmark_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkDetailHandler.handleAfterDelete(Trigger.old);
    }
}
