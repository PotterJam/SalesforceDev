trigger BenchmarkTriggerTrigger on Benchmark_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
