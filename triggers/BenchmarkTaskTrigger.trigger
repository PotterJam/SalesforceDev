trigger BenchmarkTaskTrigger on Benchmark_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkTaskHandler.handleAfterDelete(Trigger.old);
    }
}
