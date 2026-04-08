trigger BenchmarkActionTrigger on Benchmark_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkActionHandler.handleAfterDelete(Trigger.old);
    }
}
