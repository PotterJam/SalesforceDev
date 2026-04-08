trigger BenchmarkAdapterTrigger on Benchmark_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
