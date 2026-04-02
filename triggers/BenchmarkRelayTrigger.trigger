trigger BenchmarkRelayTrigger on Benchmark_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BenchmarkRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BenchmarkRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BenchmarkRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BenchmarkRelayHandler.handleAfterDelete(Trigger.old);
    }
}
