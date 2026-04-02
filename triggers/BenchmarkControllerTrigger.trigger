trigger BenchmarkControllerTrigger on Benchmark_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkControllerHandler.handleAfterDelete(Trigger.old);
    }
}
