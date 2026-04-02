trigger BenchmarkItemTrigger on Benchmark_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkItemHandler.handleAfterDelete(Trigger.old);
    }
}
