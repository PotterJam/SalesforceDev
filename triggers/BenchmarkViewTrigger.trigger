trigger BenchmarkViewTrigger on Benchmark_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkViewHandler.handleAfterDelete(Trigger.old);
    }
}
