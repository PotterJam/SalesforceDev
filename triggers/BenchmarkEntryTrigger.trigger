trigger BenchmarkEntryTrigger on Benchmark_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkEntryHandler.handleAfterDelete(Trigger.old);
    }
}
