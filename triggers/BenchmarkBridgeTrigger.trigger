trigger BenchmarkBridgeTrigger on Benchmark_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
